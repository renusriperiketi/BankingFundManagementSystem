class AddOtherColumnToCustomer < ActiveRecord::Migration[7.0]
  def change
    add_column :customers, :type_of_account, :string
  end
end
