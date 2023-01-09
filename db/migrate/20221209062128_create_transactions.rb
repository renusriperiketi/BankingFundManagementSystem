class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :type_of_transaction
      t.integer :total_amount
      t.references :customer, null: false, foreign_key: true
      t.references :saving_account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
