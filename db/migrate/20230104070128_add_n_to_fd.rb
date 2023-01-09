class AddNToFd < ActiveRecord::Migration[7.0]
  def change
    add_column :fixed_deposits, :n, :float
  end
end
