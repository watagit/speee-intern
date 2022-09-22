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

ActiveRecord::Schema[7.0].define(version: 2022_09_22_013237) do
  create_table "available_areas", id: { comment: "査定可能エリアid" }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "city_id", null: false, comment: "市区町村id"
    t.bigint "branch_id", null: false, comment: "店舗id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_available_areas_on_branch_id"
    t.index ["city_id", "branch_id"], name: "index_available_areas_on_city_id_and_branch_id", unique: true
    t.index ["city_id"], name: "index_available_areas_on_city_id"
  end

  create_table "branches", id: { comment: "店舗id" }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", comment: "店舗名"
    t.string "zip_code", null: false, comment: "郵便番号"
    t.string "phone_number", comment: "電話番号"
    t.string "fax_number", comment: "FAX番号"
    t.string "business_hours", comment: "営業時間"
    t.string "closed_day", comment: "定休日"
    t.string "introduction", null: false, comment: "紹介文"
    t.string "after_address", null: false, comment: "以降住所"
    t.bigint "company_id", null: false, comment: "企業id"
    t.bigint "city_id", null: false, comment: "市区町村id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ieul_branch_id", null: false, comment: "ieul_店舗id"
    t.index ["city_id"], name: "index_branches_on_city_id"
    t.index ["company_id"], name: "index_branches_on_company_id"
    t.index ["ieul_branch_id"], name: "index_branches_on_ieul_branch_id", unique: true
    t.index ["name", "company_id", "ieul_branch_id"], name: "index_branches_on_name_and_company_id_and_ieul_branch_id", unique: true
  end

  create_table "cities", id: { comment: "市区町村id" }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", comment: "市区町村名"
    t.bigint "prefecture_id", null: false, comment: "都道府県id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prefecture_id", "name"], name: "index_cities_on_prefecture_id_and_name", unique: true
    t.index ["prefecture_id"], name: "index_cities_on_prefecture_id"
  end

  create_table "companies", id: { comment: "企業id" }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false, comment: "企業名"
    t.string "logo_url", null: false, comment: "ロゴURL"
    t.string "catch_copy", null: false, comment: "キャッチコピー"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ieul_company_id", null: false, comment: "ieul_企業id"
    t.index ["ieul_company_id"], name: "index_companies_on_ieul_company_id", unique: true
    t.index ["name", "ieul_company_id"], name: "index_companies_on_name_and_ieul_company_id", unique: true
  end

  create_table "prefectures", id: { comment: "都道府県id" }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false, comment: "都道府県名"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_prefectures_on_name", unique: true
  end

  create_table "property_types", id: { comment: "物件種別id" }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false, comment: "物件種別名"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", id: { comment: "口コミid" }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false, comment: "名前"
    t.string "gender", null: false, comment: "性別"
    t.integer "age", null: false, comment: "年齢"
    t.string "sell_count", null: false, comment: "売却回数"
    t.date "considering_selling_at", null: false, comment: "売却検討時期"
    t.date "assessment_requested_at", null: false, comment: "査定依頼時期"
    t.date "sales_started_at", null: false, comment: "売出時期"
    t.date "sold_at", null: false, comment: "売却時期"
    t.date "delivered_at", null: false, comment: "引渡時期"
    t.integer "assessment_price", null: false, comment: "査定価格"
    t.integer "sold_price", null: false, comment: "販売価格"
    t.boolean "is_discount", null: false, comment: "値下げしたかどうか"
    t.integer "discount_date_type_after_sales_started", comment: "売り出してから何ヶ月後に値下げしたか"
    t.integer "discount_price", comment: "値下げ価格"
    t.integer "brokerage_contract_type", null: false, comment: "媒介契約の形態"
    t.string "headline", null: false, comment: "見出し"
    t.integer "reason_for_sale", null: false, comment: "売却理由"
    t.text "comment_anxiety", null: false, comment: "売却時に不安だったこと"
    t.text "comment_reason_to_decide", null: false, comment: "この会社に決めた理由"
    t.integer "satisfaction_level", null: false, comment: "不動産会社の対応満足度"
    t.text "comment_reason_for_satisfaction", null: false, comment: "不動産会社の対応満足度の理由"
    t.text "advice", null: false, comment: "今後売却する人へのアドバイス"
    t.text "comment_improvement", comment: "不動産会社に改善してほしい点"
    t.bigint "property_type_id", null: false, comment: "物件種別id"
    t.bigint "city_id", null: false, comment: "市区町村id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "branch_id", null: false, comment: "店舗id"
    t.integer "contract_price", null: false, comment: "成約価格"
    t.string "review_digest", null: false, comment: "口コミダイジェスト"
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
