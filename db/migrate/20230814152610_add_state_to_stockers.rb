# frozen_string_literal: true

class AddStateToStockers < ActiveRecord::Migration[7.0]
  def change
    add_column :stockers, :state, :string
  end
end
