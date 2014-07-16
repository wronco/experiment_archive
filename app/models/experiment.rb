# == Schema Information
#
# Table name: experiments
#
#  id                         :integer          not null, primary key
#  user_id                    :integer
#  screenshot_original        :string(255)
#  screenshot_variation       :string(255)
#  winner                     :string(255)
#  confidence                 :string(255)
#  brief                      :text
#  hypothesis                 :text
#  experiment_url             :string(255)
#  result_url                 :string(255)
#  created_at                 :datetime
#  updated_at                 :datetime
#  optimizely_id              :integer
#  status                     :string(255)
#  optimizely_created_at      :datetime
#  optimizely_last_updated_at :datetime
#

class Experiment < ActiveRecord::Base
  belongs_to :user
  has_many :experiment_goals
  has_many :goals, through: :experiment_goals
  has_many :variations

  validates_formatting_of :experiment_url, using: :url
  # validates_formatting_of :result_url, using: :url

  def update_from_optimizely_json(json)
    self.update_attributes({
      experiment_url: json['edit_url'],
      status: json['status'],
      description: json['description'],
      optimizely_created_at: json['created'],
      optimizely_last_updated_at: json['last_modified']
      })
  end

end
