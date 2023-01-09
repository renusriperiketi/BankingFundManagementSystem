require "rails_helper"

RSpec.describe SavingAccount, type: :model do
    it "should belong to Customer" do
        t=SavingAccount.reflect_on_association(:customer)
        expect(t.macro).to eq(:belongs_to)
    end
end