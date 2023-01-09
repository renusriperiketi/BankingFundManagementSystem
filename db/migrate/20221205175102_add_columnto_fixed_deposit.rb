class AddColumntoFixedDeposit < ActiveRecord::Migration[7.0]
  def change
    add_column :fixed_deposits, :account_number, :integer
    add_column :fixed_deposits, :total_amount, :integer
    add_reference :fixed_deposits, :customer
  end
end
