class CreateVariations < ActiveRecord::Migration
  def change
    create_table :variations do |t|
      t.references :experiment, index: true
      t.string :screenshot_url

      t.timestamps
    end
  end
end
