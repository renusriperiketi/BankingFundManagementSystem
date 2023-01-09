# # A= (P)( (1+ (r/n) )** (n*t) )


# def maturity_amount
#     @customer = Customer.find(params[:customer_id])
#     @fixed_deposit = @customer.fixed_deposits.find(params[:id])
#     @interest_earned= (((@fixed_deposit.total_amount + 0.00)*(@fixed_deposit.rate_of_interest + 0.00)*(@fixed_deposit.tenure + 0.00))/100) 
#     @maturity_amount= @fixed_deposit.total_amount + @interest_earned
#     render "show"
# end

# def compound_interest
#     @customer = Customer.find(params[:customer_id])
#     @fixed_deposit = @customer.fixed_deposits.find(params[:id])
#     n=7
#     @interest_earned=(@fixed_deposit.total_amount) ((1+((@fixed_deposit.rate_of_interest)/(@fixed_deposit.n)))**((@fixed_deposit.rate_of_interest)*(@fixed_deposit.tenure)))
#     @compound_interest=@fixed_deposit.total_amount + @interest_earned
#     render "show"
# end


# a= 10000
# roi = 7
# n=6
# t=5
# x= (a)*((1+ ((roi)/(n)))**((roi)*(t)))
# ci= x-a
# puts ci


p=10000
r=0.05
t=5
n=12
a = p * (1 + r/n) ** (n*t)
puts a




require 'rails_helper'

RSpec.describe DiscussionsController, type: :controller do
    subject {FactoryBot.build(:discussion)}
    context "GET index" do

        it "returns a successful response" do
          get :index
          expect(response).to be_successful
          expect(response.status).to eq(200)
        end
       
        it "assigns @article" do
          get :index
          expect(assigns(:article)).to eq(Discussion.order("pinned DESC"))
        end
 
        it "renders the index template" do
          get :index
          expect(response).to render_template("index")
        end

    end 

    context "GET new" do 
       
        it "returns a successful response" do
            get :new
            expect(response).to be_successful
            expect(response.status).to eq(200)
        end

        it "assigns @article" do
            get :new
            expect(assigns(:article)).to be_a_new(Discussion)
        end

        it "renders the new template" do
            get :new
            expect(response).to render_template("new")
            expect(response.body).to eq ""
        end

    end 

    context "POST create" do 
        it 'creates the new Article all details are given' do
            post :create, params: {discussion: {
                    title: subject.title,
                    content: subject.content,
                    name: subject.name,
                    image: subject.image,
                    pinned: subject.pinned
            }}
            expect(assigns(:article).save).to be_truthy
            expect(response).to redirect_to discussions_path
        end
    end 

    context "GET pin" do 
        it 'creates the pin Article at the top page' do 
            article = FactoryBot.create(:discussion)
            get :pin,params:{id:article.id}
            expect(assigns(:article).pinned).to be_truthy
            expect(assigns(:article).save).to be_truthy
            expect(response).to redirect_to discussions_path
        end
    end

    context "GET unpin" do 
        it 'creates the unpin Article at the bottom ' do 
            article = FactoryBot.create(:discussion)
            get :unpin,params:{id:article.id}
            expect(assigns(:article).pinned).to be_falsy
            expect(assigns(:article).save).to be_truthy
            expect(response).to redirect_to discussions_path
        end
    end
   
    context "GET Likes" do 
        it 'creates the like for given page' do 
            article = FactoryBot.create(:discussion)
            post :like,params:{id:article.id}
            expect(assigns(:article).likes).to eq(assigns(:article).likes)
            expect(assigns(:article).save).to be_truthy
            expect(response).to redirect_to discussions_path
        end
    end    
end