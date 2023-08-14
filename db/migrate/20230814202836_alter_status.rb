# frozen_string_literal: true

class AlterStatus < ActiveRecord::Migration[7.0]
  def change
    remove_column :stockers, :verification_status
    remove_column :stockers, :verification_problem

    add_column :stockers, :verification_status, :integer, default: 0
    add_column :stockers, :verification_problem, :integer
  end
end
