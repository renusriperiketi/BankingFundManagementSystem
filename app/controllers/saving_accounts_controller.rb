class SavingAccountsController < ApplicationController

    def new
        @customer=Customer.find(params[:customer_id])
        @saving_account=SavingAccount.new
        flash[:alert] = "You don't have a savings account yet, proceed to create one."
    end

    def create
        @account_number=10.times.map{rand(10)}.join
        @customer= Customer.find(params[:customer_id])
        @saving_account=@customer.build_saving_account(account_number: @account_number)

        if @saving_account.save
            flash[:notice]="Your savings account is successfully created, please add money!"
            redirect_to customer_saving_account_path(@customer)
        end
    end

    def show
        @customer=Customer.find(params[:customer_id])
        @saving_account=@customer.saving_account
    end

    def credit
        @customer=Customer.find(params[:id])
        @saving_account=@customer.saving_account
    end


    def withdraw
        @customer=Customer.find(params[:id])
        @saving_account=@customer.saving_account
    end

    def transfer
        @customer=Customer.find(params[:customer_id])
        @customers= Customer.where.not(email: @customer.email)
        @saving_account=@customer.saving_account
        
    end

    def credit_money_to_account
        
        @customer = Customer.find(params[:id])
        @saving_account=@customer.saving_account
        @saving_account.total_amount += params[:total_amount].to_i
        @saving_account.save
        flash[:notice] = "Successfully credited Rs.#{params[:total_amount]} to your savings account! "

        redirect_to request.referer
    end

    def balance
        @customer=Customer.find(params[:id])
        @saving_account=@customer.saving_account
    end

    def withdraw_money
        @customer = Customer.find(params[:id])
        @saving_account=@customer.saving_account

        if params[:total_amount].to_i > @saving_account.total_amount
            flash[:error] = "Require sufficient balance to withdraw amount entered!"
        else
            @saving_account.total_amount -= params[:total_amount].to_i
            @saving_account.save
            flash[:alert] = "Rs.#{params[:total_amount]} is debited from your savings account! "
        end

        redirect_to request.referer    
    end

    def transfer_money
        @customer1 = Customer.find(params[:id])
        @customer2 = Customer.find_by_email(params[:email])
        
        @saving2 = @customer2.saving_account
        @saving1 = @customer1.saving_account

        @saving1.total_amount-=params[:total_amount].to_i
        @saving2.total_amount+=params[:total_amount].to_i

        @saving1.save
        flash[:alert] = "Rs.#{params[:total_amount]} is debited from your savings account! "
        @saving2.save

        redirect_to request.referer
    end
    
end

# 10.times.map{rand(10)}.join
