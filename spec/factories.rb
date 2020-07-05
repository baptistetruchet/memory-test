FactoryBot.define do
  factory :transaction do
    order_id            { rand(1000..9999) }
    customer_id         { rand(1000..9999) }
    country             { Faker::Address.country }
    product_code        { SecureRandom.hex(3).upcase }
    product_description { Faker::Commerce.product_name }
    quantity            { rand(1..10) }
    unit_price_cents    { rand(50..1000) }
    date                { Faker::Date.between(from: 10.months.ago, to: Date.today) }
  end
end
