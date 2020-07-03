# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_03_131116) do

  create_table "transactions", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "customer_id", null: false
    t.string "country", null: false
    t.string "product_code", null: false
    t.string "product_description", null: false
    t.integer "quantity", null: false
    t.integer "unit_price_cents", null: false
    t.datetime "date", null: false
  end

end
