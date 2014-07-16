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

class Goal < ActiveRecord::Base
  has_many :experiment_goals
  has_many :experiments, through: :experiment_goals

  def update_from_optimizely_json(json_goal)
    self.update_attributes({
                            title: json_goal['title'], 
                            event: json_goal['event'], 
                            goal_type: json_goal['type'], 
                            revenue_tracking: json_goal['revenue_tracking'], 
                            metric: json_goal['metric']
                           })
  end
end
