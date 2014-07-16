class AddLastScanToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_optimizely_updated_at, :datetime
    add_column :users, :last_optimizely_status, :text
  end
end
