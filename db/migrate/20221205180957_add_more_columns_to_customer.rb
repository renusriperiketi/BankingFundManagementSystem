class AddMoreColumnsToCustomer < ActiveRecord::Migration[7.0]
  def change
    add_column :customers, :security_question, :string
    add_column :customers, :security_answer, :string
  end
end
