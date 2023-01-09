FactoryBot.define do
    factory :customer do
      sequence (:name) {"kiran"}
      sequence (:contact) { 7285961498 }
      sequence (:branch_name) { "Kokapet" }
      sequence (:address) { "Kokapet" }
      sequence (:city) { "Hyd" }
      sequence (:state) { "Telangana" }
      sequence (:pincode) { "500089"}
      sequence (:email) { "kiran@gmail.com" }
      sequence (:password) { "Kiran@123" }
      sequence (:security_question) { "What's your first pet name?" }
      sequence (:security_answer) { "renu" }  
      # sequence (:admin) { false }
    end
end 

