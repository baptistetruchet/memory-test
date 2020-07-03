class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.bigint :order_id, null: false, index: true
      t.bigint :customer_id, null: false, index: true
      t.string :country, null: false, index: true
      t.string :product_code, null: false
      t.string :product_description, null: false
      t.integer :quantity, null: false
      t.integer :unit_price_cents, null: false
      t.datetime :date, null: false
    end
  end
end
