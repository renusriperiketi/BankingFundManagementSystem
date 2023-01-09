class AdminsController < ApplicationController
    
    def admin_signin
        @customer = Customer.new
    end

    def validate_admin_signin
        @customer = Customer.find_by(email: params[:email])
        if @customer
            if @customer.admin == true
                if @customer.password == params[:password]
                    flash[:notice]="Signed in as Admin successfully!"
                    redirect_to admin_dashboard_path
                else
                    flash[:error] = "Invalid email or password"
                    redirect_to action: "admin_signin"
                end
            elsif @customer.admin == false
                flash[:error] = "Customer cannot login in Admin page, visit login page for customers"
                redirect_to root_path
            end
        else
            flash[:alert] = "Admin's profile doesn't exist"
        end
    end
#------------------------------------------------------------------
    def admin_customers
        @all_customers=Customer.where(admin: false)
    end

    def customer_profile
        @customer = Customer.find(params[:id])    
    end
#------------------------------------------------------------------

    def admin_savings
        @all_saving_accounts=SavingAccount.all  
    end
#------------------------------------------------------------------
    def admin_fds
        @all_fixed_deposits=FixedDeposit.all
    end

    def fd_details
        @customer=Customer.find(params[:customer_id])
        @fixed_deposit=@customer.fixed_deposits.find(params[:id])
    end

    def admin_maturity_amount
        @all_fixed_deposits = FixedDeposit.all
        @fixed_deposit = @all_fixed_deposits.find(params[:id])
        @interest_earned= (((@fixed_deposit.total_amount + 0.00)*(@fixed_deposit.rate_of_interest + 0.00)*(@fixed_deposit.tenure + 0.00))/100) 
        @maturity_amount= @fixed_deposit.total_amount + @interest_earned
        render "show"
    end
end
