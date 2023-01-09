class ChangeColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :customers, :roles, :role
  end
end
