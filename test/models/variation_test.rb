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

require 'test_helper'

class VariationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
