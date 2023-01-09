class AddColumnsToCustomers < ActiveRecord::Migration[7.0]
  def change
    remove_column :customers, :admin
    add_column :customers, :interests, :string
    add_column :customers, :roles, :string
  end
end
