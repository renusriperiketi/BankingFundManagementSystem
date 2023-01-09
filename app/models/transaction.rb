class Transaction < ApplicationRecord
  belongs_to :customer
  belongs_to :saving_account
end
