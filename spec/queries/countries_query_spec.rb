require 'rails_helper'

RSpec.describe CountriesQuery, type: :query do
  let(:query_helper) { CountriesQuery.new }

  describe "#get_all" do
    it "should returns all countries" do
      create(:transaction, country: "USA")
      create(:transaction, country: "USA")
      create(:transaction, country: "France")
      create(:transaction, country: "Australia")

      expect(query_helper.get_all.sort).to eq %w[Australia France USA]
    end
  end
end
