class Customer < ApplicationRecord
    has_one :saving_account, dependent: :destroy
    has_many :fixed_deposits, dependent: :destroy

    validates :name, presence: true
    validates_format_of :contact, with: /[+]?[0-9\s]{1,3}[0-9\s]{1,10}/, message: "Invalid Phone number" ,length: { maximum:10 }
    validates_format_of :email, with: /[a-zA-Z0-9]+@[a-zA-z]+\.[a-z]{2,5}/, uniqueness: true, message: "Email already taken", presence: true
    validates :branch_name, presence: true
    validates :address, presence: true
    validates :city, presence: true
    validates :state, presence: true
    validates_format_of :pincode, with: /([1-9]{1}[0-9]{5}|[1-9]{1}[0-9]{3}\\s[0-9]{3})/, message: "Enter valid pincode", length: {maximum:6} 
    validates :password, confirmation: true
    validates :security_answer, presence: true
   
    validate :password_validate

    def password_validate
        if  password.blank?
            errors.add :password, "password can't be blank!"
        end
        
        unless password =~ /[A-Z]+/
            errors.add :password, ' must contain at least 1 uppercase '
        end

        unless password =~ /[a-z]+/
            errors.add :password, ' must contain at least 1 lowercase '
        end

        unless password =~ /[0-9]+/
            errors.add :password, ' must contain at least 1 digit '
        end

        unless password =~ /[!@#$%^&*]+/
            errors.add :password, ' must contain at least 1 special character '
        end
    end
end
