# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  optimizely_api_key     :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :experiments
  has_many :goals, through: :experiments



  def refresh_from_optimizely
    self.optimizely_refresh_started_at = Time.now
    save
    projects = self.get("projects")
    goals = []
    experiments_count = 0
    projects.each do |p|
      remote_experiments = self.get("projects/#{p['id']}/experiments")
      remote_experiments.each do |e|
        exp = Experiment.find_or_create_by(user_id: self.id, optimizely_id: e['id'])
        exp.update_from_optimizely_json(e)

        variations = e['variation_ids']
        variations.each do |v|
          variation = Variation.find_or_create_by(experiment_id: exp.id, optimizely_id: v)
        end
        e['display_goal_order_lst'].each do |g|
          current_goal = self.get("goals/#{g}/")
          goal = Goal.find_or_create_by(optimizely_id: current_goal['optimizely_id'])
          goal.update_from_optimizely_json(current_goal)
          exp.goals << goal unless exp.goals.include?(goal)
        end
      end
      experiments_count += 1
    end
    self.last_optimizely_updated_at = Time.now
    self.last_optimizely_status = "#{experiments_count} experiments updated in #{projects.count} projects"
    save
  end

  def refresh_running?
    if optimizely_refresh_started_at.present? 
      if last_optimizely_updated_at.blank? || optimizely_refresh_started_at < last_optimizely_updated_at
        return true
      end
    end
    false
  end

  def get(url)
    uri      = URI.parse("https://www.optimizelyapis.com/experiment/v1/#{url}/")
    https    = Net::HTTP.new(uri.host, uri.port)
    # https.read_timeout = @options[:timeout] if @options[:timeout]
    https.verify_mode = OpenSSL::SSL::VERIFY_NONE
    https.use_ssl = true
    headers = {}
    headers['Token'] = optimizely_api_key
    headers['Content-Type'] = "application/json"
    request  = Net::HTTP::Get.new(uri.request_uri, headers)
    response = https.request(request)

    # Response code error checking
    if response.code != '200'
      puts "#{url}: #{response.code}"
      return []
      # raise SomeKindOfError
      # check_response(response.code, response.body)
    else
      JSON.parse(response.body)
    end
  end


end
