require "rails_helper"

RSpec.describe FixedDeposit, type: :model do
    it "should belong to Customer" do
        t=FixedDeposit.reflect_on_association(:customer)
        expect(t.macro).to eq(:belongs_to)
    end
end