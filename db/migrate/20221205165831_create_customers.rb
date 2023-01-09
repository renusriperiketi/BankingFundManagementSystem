class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string "name"
      t.integer "contact"
      t.string "branch_name"
      t.string "address"
      t.string "city"
      t.string "state"
      t.string "pincode"
      t.string "email"
      t.string "password"

      t.timestamps
    end
  end
end
