class AddColumnsToStockersB < ActiveRecord::Migration[7.0]
  def change
    add_column :stockers, :verification_problem, :string
  end
end
