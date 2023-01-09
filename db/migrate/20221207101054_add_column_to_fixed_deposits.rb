class AddColumnToFixedDeposits < ActiveRecord::Migration[7.0]
  def change
    add_column :fixed_deposits, :interest_plan, :string
  end
end
