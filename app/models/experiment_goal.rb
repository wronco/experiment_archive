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

class ExperimentGoal < ActiveRecord::Base
  belongs_to :experiment
  belongs_to :goal
end
