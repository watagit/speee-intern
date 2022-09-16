# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_09_16_052745) do
  create_table "available_areas", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "city_id", null: false
    t.bigint "branch_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_available_areas_on_branch_id"
    t.index ["city_id", "branch_id"], name: "index_available_areas_on_city_id_and_branch_id", unique: true
    t.index ["city_id"], name: "index_available_areas_on_city_id"
  end

  create_table "branches", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "zip_code", null: false
    t.string "phone_number"
    t.string "fax_number"
    t.string "business_hours"
    t.string "closed_day"
    t.string "introduction", null: false
    t.string "after_address", null: false
    t.bigint "company_id", null: false
    t.bigint "city_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ieul_branch_id", null: false
    t.index ["city_id"], name: "index_branches_on_city_id"
    t.index ["company_id"], name: "index_branches_on_company_id"
    t.index ["ieul_branch_id"], name: "index_branches_on_ieul_branch_id", unique: true
    t.index ["name", "company_id", "ieul_branch_id"], name: "index_branches_on_name_and_company_id_and_ieul_branch_id", unique: true
  end

  create_table "cities", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.bigint "prefecture_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prefecture_id", "name"], name: "index_cities_on_prefecture_id_and_name", unique: true
    t.index ["prefecture_id"], name: "index_cities_on_prefecture_id"
  end

  create_table "companies", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "logo_url", null: false
    t.string "catch_copy", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ieul_company_id", null: false
    t.index ["ieul_company_id"], name: "index_companies_on_ieul_company_id", unique: true
    t.index ["name", "ieul_company_id"], name: "index_companies_on_name_and_ieul_company_id", unique: true
  end

  create_table "prefectures", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_prefectures_on_name", unique: true
  end

  create_table "property_types", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "gender", null: false
    t.integer "age", null: false
    t.string "sell_count", null: false
    t.date "considering_selling_at", null: false
    t.date "assessment_requested_at", null: false
    t.date "sales_started_at", null: false
    t.date "sold_at", null: false
    t.date "delivered_at", null: false
    t.integer "assessment_price", null: false
    t.integer "sold_price", null: false
    t.boolean "is_discount", null: false
    t.integer "discount_date_type_after_sales_started"
    t.integer "discount_price"
    t.integer "brokerage_contract_type", null: false
    t.string "headline", null: false
    t.integer "reason_for_sale", null: false
    t.text "comment_anxiety", null: false
    t.text "comment_reason_to_decide", null: false
    t.integer "satisfaction_level", null: false
    t.text "comment_reason_for_satisfaction", null: false
    t.text "advice", null: false
    t.text "comment_improvement"
    t.bigint "property_type_id", null: false
    t.bigint "city_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "branch_id", null: false
    t.integer "contract_price", null: false
    t.string "review_digest", null: false
    t.index ["branch_id"], name: "index_reviews_on_branch_id"
    t.index ["city_id"], name: "index_reviews_on_city_id"
    t.index ["property_type_id"], name: "index_reviews_on_property_type_id"
    t.index ["review_digest"], name: "index_reviews_on_review_digest", unique: true
  end

  add_foreign_key "available_areas", "branches"
  add_foreign_key "available_areas", "cities"
  add_foreign_key "branches", "cities"
  add_foreign_key "branches", "companies"
  add_foreign_key "cities", "prefectures"
  add_foreign_key "reviews", "branches"
  add_foreign_key "reviews", "cities"
  add_foreign_key "reviews", "property_types"
end
