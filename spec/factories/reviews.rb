# rubocop:disable Metrics/BlockLength
FactoryBot.define do
  factory :review do
    name { Faker::Lorem.sentence(word_count: 3) }
    gender { '男性' }
    age { Faker::Number.between(from: 30, to: 50) }
    sell_count { '初めて' }
    considering_selling_at { '2022-09-20' }
    assessment_requested_at { '2022-09-20' }
    sales_started_at { '2022-09-20' }
    sold_at { '2022-09-20' }
    delivered_at { '2022-09-20' }
    assessment_price { Faker::Number.between(from: 10_000_000, to: 500_000) }
    sold_price { Faker::Number.between(from: 10_000_000, to: 500_000) }
    is_discount { 0 }
    discount_date_type_after_sales_started { 1 }
    brokerage_contract_type { 1 }
    headline { Faker::Lorem.sentence(word_count: 2) }
    reason_for_sale { 5 }
    comment_anxiety { Faker::Lorem.sentence(word_count: 10) }
    comment_reason_to_decide { Faker::Lorem.sentence(word_count: 10) }
    satisfaction_level { 5 }
    comment_reason_for_satisfaction { Faker::Lorem.sentence(word_count: 10) }
    advice { Faker::Lorem.sentence(word_count: 10) }
    contract_price { Faker::Number.between(from: 10_000_000, to: 500_000) }
    review_digest { Faker::Lorem.sentence(word_count: 1) }
    # reason_for_sale { 5 }

    association :property_type
    # association :city
    association :branch
    city { branch.city }
  end
end
# rubocop:enable Metrics/BlockLength
