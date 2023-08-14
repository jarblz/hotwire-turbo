# frozen_string_literal: true

class AddColumnsToStockers < ActiveRecord::Migration[7.0]
  def change
    add_column :stockers, :verification_status, :string
    add_column :stockers, :interpreted_address, :string
  end
end
