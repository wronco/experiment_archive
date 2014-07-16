# == Schema Information
#
# Table name: goals
#
#  id               :integer          not null, primary key
#  title            :string(255)
#  goal_type        :integer
#  optimizely_id    :integer
#  event            :string(255)
#  revenue_tracking :boolean
#  metric           :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

require 'test_helper'

class GoalTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
