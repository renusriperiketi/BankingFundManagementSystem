FactoryBot.define do
    factory :saving_account do
      sequence (:total_amount) { 3466777 }
      sequence (:account_number) { 1552122545}
      sequence (:customer_id) {|i| i}
    end
end 


