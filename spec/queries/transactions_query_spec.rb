require 'rails_helper'

RSpec.describe TransactionsQuery, type: :query do
  let(:query_helper) { TransactionsQuery.new }
  let(:france_query_helper) { TransactionsQuery.new(country: "France") }

  describe "#get_total_revenue" do
    it "sums transactions amount" do
      expect(query_helper.get_total_revenue).to eq 0

      create(:transaction, quantity: 2, unit_price_cents: 100)
      create(:transaction, quantity: 5, unit_price_cents: 400)

      expect(query_helper.get_total_revenue).to eq (2 * 100 + 5 * 400)
    end

    it "sums transactions amount of a specific country" do
      create(:transaction, quantity: 2, unit_price_cents: 100, country: "USA")
      create(:transaction, quantity: 5, unit_price_cents: 400, country: "France")

      expect(france_query_helper.get_total_revenue).to eq (5 * 400)
    end
  end
end
