# == Schema Information
#
# Table name: experiment_goals
#
#  id            :integer          not null, primary key
#  experiment_id :integer
#  goal_id       :integer
#  created_at    :datetime
#  updated_at    :datetime
#

require 'test_helper'

class ExperimentGoalTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
