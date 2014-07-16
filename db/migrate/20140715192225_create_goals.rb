class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :title
      t.integer :goal_type
      t.integer :optimizely_id
      t.string :event
      t.boolean :revenue_tracking
      t.string :metric

      t.timestamps
    end
  end
end
