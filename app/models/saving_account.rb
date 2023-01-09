class SavingAccount < ApplicationRecord
    belongs_to :customer,optional:true
    # belongs_to :bank_admin
end
