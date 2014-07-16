class AddScreencapToVariations < ActiveRecord::Migration
  def self.up
    add_attachment :variations, :screencap
  end

  def self.down
    remove_attachment :variations, :screencap
  end
end
