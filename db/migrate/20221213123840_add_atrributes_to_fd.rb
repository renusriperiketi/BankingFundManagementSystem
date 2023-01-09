class AddAtrributesToFd < ActiveRecord::Migration[7.0]
  def change
    add_column :fixed_deposits, :tenure, :float
    rename_column :fixed_deposits, :interest_plan, :rate_of_interest
  end
end
