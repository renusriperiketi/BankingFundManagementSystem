require 'rails_helper'

RSpec.describe AdminsController, type: :controller do
    subject {FactoryBot.build(:customer)}
    context "GET index" do
        it "returns a successful response"do
            get "/customers/index"
            expect(response).to be_successful
            expect(response.status).to eq(200)
        end

        it "gets signin page" do
            get :admin_signin
            post :validate_admin_signin, params:{customer: {
                email: subject.email,
                password:subject.password,
            }}
            expect(assigns(customer).admin).to be_truthy
            expect(assigns(customer).password).to eq(params[:password])
            expect(flash[:notice]).to match(/Signed in as Admin successfully!*/)
            expect(response).to have_http_status(200)
        end
    end


    context "GET  Dashboard page" do
        it "SHOW admin dashboard" do
            get "/admin/dashboard" 
            expect(response).to render_template("index")
            expect(response.status).to eq(200) 
        end
    end

    context "GET All customers" do
        it "get all customers " do
            subject {FactoryBot.build(:customer)}
            get "admin/all_customers"
            expect(assigns(:all_customers)).to eq(Customer.all)
            expect(response).to render_template("admin_customers")
            expect(response).to have_http_status(200)
            expect(response).to redirect_to customer_profile_path
        end
    end

        it "get each and every customer profile" do
            get "admin/customer_profile/:id" params:{id:customer.id}
    
            expect(response).to render_template(:customer_profile)
            expect(response).to have_http_status(200)
        end
 

        it "get all saving accounts" do
            get "admin/all_saving_accounts"
            expect(response).to render_template(:admin_savings)
            expect(response).to have_http_status(200)
        end

        it "get all fixed deposits" do
            get "admin/all_fixed_deposits"
            expect(response).to render_template(:admin_fds)
            expect(response).to have_http_status(200)
        end

        it "get each and every fixed deposit" do
            get "admin/fd_details"
            expect(response).to render_template(:fd_details)
            expect(response).to have_http_status(200)
        end

end






