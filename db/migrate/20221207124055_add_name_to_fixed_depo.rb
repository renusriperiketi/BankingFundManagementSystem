class AddNameToFixedDepo < ActiveRecord::Migration[7.0]
  def change
    add_column :fixed_deposits, :fixed_deposit_name, :string
    remove_column :saving_accounts, :total_amount, :integer
    add_column :saving_accounts, :total_amount, :integer, default: 0
  end
end
