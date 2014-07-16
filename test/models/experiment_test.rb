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

require 'test_helper'

class ExperimentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
