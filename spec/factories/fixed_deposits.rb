FactoryBot.define do
    factory :fixed_deposit do
      sequence (:total_amount) { 40000 }
      sequence (:rate_of_interest) { 0.06 }
      sequence (:fixed_deposit_name) { "cdf" }
      sequence (:tenure) { 8.0 }
      sequence (:n) { 12.0 }
      sequence (:customer_id) {|i| i}
    end
end 




