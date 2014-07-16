class AddDescriptionToExperiments < ActiveRecord::Migration
  def change
    add_column :experiments, :description, :text
  end
end
