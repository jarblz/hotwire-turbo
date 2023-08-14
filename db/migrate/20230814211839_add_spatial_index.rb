class AddSpatialIndex < ActiveRecord::Migration[7.0]
  def change
    add_index :stockers, :lonlat, using: :gist
  end
end
