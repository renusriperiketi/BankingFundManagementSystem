class FixedDeposit < ApplicationRecord
    belongs_to :customer
    # belongs_to :bank_admin

    validates :total_amount, numericality:  { greater_than: 10000, message:"Minimum amount to make a fixed deposit is 10,000 rupees"} 
end
