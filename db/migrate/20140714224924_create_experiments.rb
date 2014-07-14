class CreateExperiments < ActiveRecord::Migration
  def change
    create_table :experiments do |t|
      t.references :user, index: true
      t.string :screenshot_original
      t.string :screenshot_variation
      t.string :winner
      t.string :confidence
      t.text :brief
      t.text :hypothesis
      t.string :experiment_url
      t.string :result_url

      t.timestamps
    end
  end
end
