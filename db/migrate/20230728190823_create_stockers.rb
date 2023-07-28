# frozen_string_literal: true

class CreateStockers < ActiveRecord::Migration[7.0]
  def change
    create_table :stockers do |t|
      t.date :date_stocked
      t.string :species
      t.integer :quantity
      t.decimal :avg_length
      t.string :water_name
      t.string :county
      t.st_point :lonlat

      t.timestamps
    end
  end
end
