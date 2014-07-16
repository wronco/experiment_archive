class CreateExperimentGoals < ActiveRecord::Migration
  def change
    create_table :experiment_goals do |t|
      t.references :experiment, index: true
      t.references :goal, index: true

      t.timestamps
    end
  end
end
