require 'rails_helper'

RSpec.describe TransactionsQuery, type: :query do
  let(:query_helper) { TransactionsQuery.new }
  let(:france_query_helper) { TransactionsQuery.new(country: "France") }

  before(:all) do
    Transaction.destroy_all

    create(:transaction, customer_id: 1, order_id: 1, quantity: 2, unit_price_cents: 100, date: "2010-12-03", country: "France")
    create(:transaction, customer_id: 1, order_id: 1, quantity: 5, unit_price_cents: 400, date: "2010-12-03", country: "France")
    create(:transaction, customer_id: 2, order_id: 2, quantity: 3, unit_price_cents: 800, date: "2011-01-15", country: "France")
    create(:transaction, customer_id: 3, order_id: 3, quantity: 1, unit_price_cents: 500, date: "2011-01-18", country: "USA")
  end

  after(:all) do
    Transaction.destroy_all
  end

  describe "#get_total_revenue" do
    it "sums transactions amount" do
      expect(query_helper.get_total_revenue).to eq 5100
    end

    it "sums transactions amount of a specific country" do
      expect(france_query_helper.get_total_revenue).to eq 4600
    end
  end

  describe "#get_number_of_distinct_customers" do
    it "returns the number of disctinct customers" do
      expect(query_helper.get_number_of_distinct_customers).to eq 3
    end

    it "returns the number of distinct customers of a specific country" do
      expect(france_query_helper.get_number_of_distinct_customers).to eq 2
    end
  end

  describe "#get_average_revenue_per_order" do
    it "returns the average revenue per order" do
      expect(query_helper.get_average_revenue_per_order).to eq 1700
    end

    it "returns the average revenue per order of a specific country" do
      expect(france_query_helper.get_average_revenue_per_order).to eq 2300
    end
  end

  describe "#get_revenue_by_month" do
    it "returns the revenue group by month" do
      expect(query_helper.get_revenue_by_month).to eq [["2010-12", 2200], ["2011-01", 2900]]
    end

    it "returns the revenue group by month of a specific country" do
      expect(france_query_helper.get_revenue_by_month).to eq [["2010-12", 2200], ["2011-01", 2400]]
    end
  end
end
