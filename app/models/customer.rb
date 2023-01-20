class Customer < ApplicationRecord
    has_one :saving_account, dependent: :destroy
    has_many :fixed_deposits, dependent: :destroy

   
   
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
