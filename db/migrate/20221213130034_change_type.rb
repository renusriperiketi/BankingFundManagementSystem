class ChangeType < ActiveRecord::Migration[7.0]
  def self.up
    change_table :fixed_deposits do |t|
      t.change :rate_of_interest, :float
    end
  end
  def self.down
    change_table :fixed_deposits do |t|
      t.change :rate_of_interest, :string
    end
  end
end
