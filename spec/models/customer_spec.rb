require "rails_helper"

RSpec.describe Customer, type: :model do
    it "should have one savings account" do
        t=Customer.reflect_on_association(:saving_account)
        expect(t.macro).to eq(:has_one)
    end

    it "should have many fixed deposits" do
        t=Customer.reflect_on_association(:fixed_deposits)
        expect(t.macro).to eq(:has_many)
    end

    context 'when creating a customer' do
        let(:customer) { create :customer}
            it "should be a valid customer with all attributes" do
                expect(customer.valid?).to eq(true)
            end
    end
end

