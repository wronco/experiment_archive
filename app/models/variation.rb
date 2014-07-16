# == Schema Information
#
# Table name: variations
#
#  id             :integer          not null, primary key
#  experiment_id  :integer
#  screenshot_url :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#  optimizely_id  :integer
#

class Variation < ActiveRecord::Base
  validates_presence_of :experiment_id
  validates_presence_of :optimizely_id

  belongs_to :experiment
  before_save :get_screenshot_url

  has_attached_file :screencap, styles: {
    thumb: '75',
    medium: '320'
  }

  validates_attachment_content_type :screencap, :content_type => /\Aimage\/.*\Z/


  def get_screenshot_url(force_reprocess=false)
    if screenshot_url.blank? || force_reprocess
      my_image_url = experiment.experiment_url + "?optimizely_x#{experiment.optimizely_id}=#{optimizely_id}"
      options = {
        force: force_reprocess,
        fullpage: true
      }
      self.screenshot_url = Url2png::Helpers::Common.url2png_image_url(my_image_url, options)
      self.screencap = URI.parse(screenshot_url)
    end
  end
end
