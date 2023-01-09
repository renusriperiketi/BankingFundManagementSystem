require "rails_helper"

RSpec.describe SavingAccountsController, type: :controller do
    subject {FactoryBot.build(:saving_account)}
    context "GET index" do
        it "returns a successful response"do
            get "/customers/index"
            expect(response).to be_successful
            expect(response.status).to eq(200)
        end


end