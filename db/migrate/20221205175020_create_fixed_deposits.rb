class CreateFixedDeposits < ActiveRecord::Migration[7.0]
  def change
    create_table :fixed_deposits do |t|

      t.timestamps
    end
  end
end
