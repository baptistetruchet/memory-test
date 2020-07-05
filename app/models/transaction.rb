class Transaction < ApplicationRecord
  validates_presence_of :order_id, :customer_id, :country,
                        :product_code, :product_description,
                        :quantity, :unit_price_cents, :date

  def unit_price
    return nil if unit_price_cents.nil?

    unit_price_cents.fdiv(100)
  end

  def unit_price=(value)
    self.unit_price_cents = (value.to_f * 100).round
  end
end
