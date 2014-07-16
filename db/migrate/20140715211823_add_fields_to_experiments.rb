class AddFieldsToExperiments < ActiveRecord::Migration
  def change
    add_column :experiments, :optimizely_id, :integer
    add_column :experiments, :status, :string
    add_column :experiments, :optimizely_created_at, :datetime
    add_column :experiments, :optimizely_last_updated_at, :datetime
  end
end
