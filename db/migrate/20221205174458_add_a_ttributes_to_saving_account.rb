class AddATtributesToSavingAccount < ActiveRecord::Migration[7.0]
  def change
    add_column :saving_accounts, :account_number, :integer
    add_column :saving_accounts, :total_amount, :integer
    add_reference :saving_accounts, :customer
  end
end
