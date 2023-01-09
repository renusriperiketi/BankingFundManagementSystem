class FixedDepositsController < ApplicationController
    def index
        @customer =Customer.find(params[:customer_id])
        @fixed_deposit = FixedDeposit.all
    end

    def create
        @account_number=10.times.map{rand(10)}.join
        # fd_params = params[:fixed_deposit]
        @customer= Customer.find(params[:customer_id])

        # @fixed_deposit=@customer.build_fixed_deposit(account_number: @account_number, total_amount: fd_params[:total_amount], fixed_deposit_name: fd_params[:fixed_deposit_name], interest_plan: fd_params[:interest_plan])
        # @fixed_deposit=@customer.build_fixed_deposit(account_number: @account_number)
        @fixed_deposit=@customer.fixed_deposits.create(fixed_deposit_params)

        if @fixed_deposit.total_amount < 10000
            flash[:error] = "Minimum amount to make a fixed deposit is 10,000"
        elsif @fixed_deposit.save
            flash[:notice] = "Your Fixed deposit of Rs.#{@fixed_deposit.total_amount} is successfully created with the name of #{@fixed_deposit.fixed_deposit_name}! Thank you, visit again!"
        end

        redirect_to customer_fixed_deposits_path(@customer)
    end

    def new
        @customer=Customer.find(params[:customer_id])
        @fixed_deposit=FixedDeposit.new
    end

    def show
        @customer=Customer.find(params[:customer_id])
        @fixed_deposit=@customer.fixed_deposits.find(params[:id])
    end

    def maturity_amount
        @customer = Customer.find(params[:customer_id])
        @fixed_deposit = @customer.fixed_deposits.find(params[:id])
        @interest_earned= (((@fixed_deposit.total_amount + 0.00)*(@fixed_deposit.rate_of_interest + 0.00)*(@fixed_deposit.tenure + 0.00))/100) 
        @maturity_amount= @fixed_deposit.total_amount + @interest_earned
        render "show"
    end

    def compound_interest
        @customer = Customer.find(params[:customer_id])
        @fixed_deposit = @customer.fixed_deposits.find(params[:id])
        @compound_interest = ((@fixed_deposit.total_amount + 0.00) * ( 1 + (@fixed_deposit.rate_of_interest + 0.00)/ (@fixed_deposit.n + 0.00)) ** ((@fixed_deposit.n + 0.00)* (@fixed_deposit.tenure + 0.00))).round(2)
        render "show"
    end

    private
        def fixed_deposit_params
            params.permit(:total_amount, :account_number, :fixed_deposit_name, :rate_of_interest, :tenure, :n)
        end
end
