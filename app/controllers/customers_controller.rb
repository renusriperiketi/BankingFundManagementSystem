class CustomersController < ApplicationController
    def index
        @customer = Customer.all
    end

    def new
        @customer = Customer.new
    end
    
    def create    
        @customer = Customer.new(customer_params)
        if @customer.save            
            redirect_to signin_customer_path
            flash[:notice]= "User created successfully"
        else  
            render :new, status: :unprocessable_entity
        end
    end

    def security
        @customer = Customer.find(params[:id])
    end
    
    def validate_security
        @customer = Customer.find_by(email: params[:email])
    
        if @customer
          redirect_to action: "security",id: @customer.id
        else
          redirect_to action: "validate_security"
        end
    end
    
    def security_answer
        @customer = Customer.find(params[:id])
    end
    
    def validate_security_answer
        @customer = Customer.find(params[:id])
        if @customer.security_answer == params[:security_answer]
          redirect_to action: "security_answer",id: @customer
        else
          redirect_to action: "validate_security_answer"
        end
    end
    
    def signin
        @customer = Customer.new
    end
    
    def validate_signin
        @customer = Customer.find_by(email: params[:email])
        if @customer
            if @customer.admin == false
                if @customer.password == params[:password]
                    flash[:notice]="Signed in as customer successfully!"
                    redirect_to action: "show", id: @customer
                else
                    flash[:error] = "Invalid email or password"
                    redirect_to action: "signin"
                end
            elsif @customer.admin == true
                flash[:notice]="Signed in as customer successfully!"
                redirect_to action: "show", id: @customer
            end
        else
            flash[:alert] = "Customer's profile doesn't exist"
        end
    end
    

    def show
        @customer = Customer.find(params[:id])
    end
    
    def forgotpassword
        @customer = Customer.new
    end
    
    def update_forgotpassword
        @customer = Customer.find(params[:id])
        if @customer.email
            if @customer.security_answer == params[:security_answer]
                flash[:notice]="Security key verified, go ahead and create new password"
                render :securityanswer, status: :unprocessable_entity
                @customer.update(:password => params[:new_password])
            
            end
        else
            flash[:error] = "User doesn't exist"
            redirect_to action: "signin"
        end
    end
    
    def changepassword
        @customer=Customer.find(params[:id])
    end
    
    def update_changepassword
        
        @customer = Customer.find(params[:id])
        if @customer.password == params[:current_password] and @customer.role == "Customer"
            if params[:new_password] == params[:new_password_confirmation]
                @customer.update(:password => params[:new_password])
                flash[:notice] = "Password changed successfully, please login once again"
                redirect_to action: "signin"
            end
        else
            redirect_to action: "forgotpassword"
        end
    end
    
    def edit
        @customer = Customer.find(params[:id])
    end
    
    def update
        @customer = Customer.find(params[:id])
    
        if @customer.update(update_details)
            redirect_to action: "show"
            flash[:notice] = "Your profile has been updated."
        else
            render :edit, status: :unprocessable_entity
        end
    end
    
    private
        def customer_params
            params.require(:customer).permit(:name, :contact, :branch_name, :address, :city, :state, :pincode, :email, :password, :security_question, :security_answer, :role)
        end
    
        def update_details
            params.permit(:email, :name, :phonenumber, :security_question)
        end
    
        def update_password
            params.permit(:password)
        end
end


