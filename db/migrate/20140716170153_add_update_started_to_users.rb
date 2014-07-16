class AddUpdateStartedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :optimizely_refresh_started_at, :datetime
  end
end
