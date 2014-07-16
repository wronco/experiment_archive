class AddOptimizelyVariationToVariations < ActiveRecord::Migration
  def change
    add_column :variations, :optimizely_id, :integer, limit: 8
  end
end
