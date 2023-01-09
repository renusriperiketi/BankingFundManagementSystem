class RemoveColumnsInCustomer < ActiveRecord::Migration[7.0]
  def change
    remove_column :customers, :type_of_account
  end
end
