class CreateSavingAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :saving_accounts do |t|

      t.timestamps
    end
  end
end
