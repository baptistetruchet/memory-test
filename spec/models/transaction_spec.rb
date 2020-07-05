require 'rails_helper'

RSpec.describe Transaction, type: :model do
  let(:transaction) { build(:transaction) }

  it { should validate_presence_of(:order_id) }
  it { should validate_presence_of(:customer_id) }
  it { should validate_presence_of(:country) }
  it { should validate_presence_of(:product_code) }
  it { should validate_presence_of(:product_description) }
  it { should validate_presence_of(:quantity) }
  it { should validate_presence_of(:unit_price_cents) }
  it { should validate_presence_of(:date) }

  it "should have a valid factory" do
    expect(transaction).to be_valid
    expect { create(:transaction) }.not_to raise_error
  end

  describe "#unit_price" do
    it "should match unit_price_cents" do
      transaction.unit_price_cents = 1500
      expect(transaction.unit_price).to eq 15
    end
    
    it "should handle nil case" do
      transaction.unit_price_cents = nil
      expect(transaction.unit_price).to be_nil
    end
  end

  describe "#unit_price=" do
    it "should set unit_price_cents" do
      transaction.unit_price = 15.50
      expect(transaction.unit_price_cents).to eq 1550
    end

    it "should work with a string input" do
      transaction.unit_price = "10.50"
      expect(transaction.unit_price_cents).to eq 1050
    end

    it "should handle nil case" do
      transaction.unit_price = nil
      expect(transaction.unit_price_cents).to be_nil
    end
  end
end
