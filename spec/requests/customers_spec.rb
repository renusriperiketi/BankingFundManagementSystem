require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
    it "gets index" do
        get "/customers/index"
        expect(response).to render_template(:index)
    end
    
    it "creates a Customer and redirects to the Customer's page" do
        get "/customers/new"
        expect(response).to render_template(:new)
        
        post "/customers", :params => { :customer => {:name => "Kiran"} }
        expect(response).to redirect_to(assigns(:customer))
        follow_redirect!
        expect(response).to render_template(:show)
        expect(response.body).to include("User created successfully")
    end


    it "gets signin page" do
        get "/customers/signin"
        expect(response).to render_template(:signin)

        post validate_signin_path, :params => { :customer => {:email => "kiran@gmail.com", :password => "Kiran@123"}}
        expect(response).to redirect_to(assigns(:customer))
        follow_redirect!
        expect(@customer.admin).to be(false)
        expect(params.password).to eq(@customer.password)
        expect(response).to render_template(:show)
        expect(response.body).to include("Signed in as customer successfully!")
        expect(response).to have_http_status(200)
    end

    it "gets admins signin page " do
        get "/customers/signin"
        subject {FactoryBot.build(:customer)}
        expect(response).to render_template(:admin_signin)

        post validate_signin_path, :params => { :customer => {:email => "admin@gmail.com", :password => "Admin@123"}}
        expect(response).to redirect_to(assigns(:customer))
        follow_redirect!
        expect(@customer.admin).to be(true)
        expect(params.password).to eq(@customer.password)
        expect(response).to render_template(:show)
        expect(response.body).to include("Signed in as admin successfully!")
        expect(response).to have_http_status(200)
    end


    it "get show page" do
        get "/customers/show"
        expect(response).to render_template(:show)
        expect(response).to have_http_status(200)
    end
end



# require 'rails_helper'

# RSpec.describe CustomersController, type: :controller do
#     subject {FactoryBot.build(:customer)}
#     context "GET index" do
#         it "returns home page" do
#             get "customers/index"
#             expect(response).to be_successful
#             expect(response.status).to eq(200)
#         end

#         it "assigns @ customer" do
#             get "customers/index"
#         end


#         it "renders the index template" do
#             get "customers/index"
#             expect(response).to render_template("index")
#         end
#     end
end