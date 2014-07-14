class Experiment < ActiveRecord::Base
  belongs_to :user
  validates_formatting_of :screenshot_original, using: :url
  validates_formatting_of :screenshot_variation, using: :url
end
