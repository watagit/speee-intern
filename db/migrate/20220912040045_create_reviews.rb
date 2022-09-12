class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :name, null: false
      t.string :gender, null: false
      t.integer :age, null: false
      t.integer :sell_count, null: false
      t.date :considering_selling_at, null: false
      t.date :assessment_requested_at, null: false
      t.date :sales_started_at, null: false
      t.date :sold_at, null: false
      t.date :delivered_at, null: false
      t.integer :assessment_price, null: false
      t.integer :sold_price, null: false
      t.boolean :is_discount, null: false
      t.integer :discount_date_type_after_sales_started
      t.integer :discount_price
      t.integer :brokerage_contract_type, null: false
      t.string :headline, null: false
      t.integer :reason_for_sale, null: false
      t.text :comment_anxiety, null: false
      t.text :comment_reason_to_decide, null: false
      t.integer :satisfaction_level, null: false
      t.text :comment_reason_for_satisfaction, null: false
      t.text :advice, null: false
      t.text :comment_improvement, null: false
      t.references :property_type, foreign_key: true, null: false
      t.references :city, foreign_key: true, null: false

      t.timestamps
    end
  end
end
