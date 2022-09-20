FactoryBot.define do
  factory :assessment_form do
    ieul_branch_id { Faker::Number.between(from: 0, to: 1024) }
    property_city { Faker::Number.between(from: 0, to: 1899) }
    property_type { Faker::Number.between(from: 1, to: 3) }
    property_exclusive_area { Faker::Number.between(from: 0, to: 1000) }
    property_land_area { Faker::Number.between(from: 0, to: 1000) }
    property_building_area { Faker::Number.between(from: 0, to: 1000) }
    property_building_area_unit { Faker::Number.between(from: 1, to: 2) }
    property_floor_area { Faker::Number.between(from: 0, to: 1000) }
    property_room_plan { Faker::Number.between(from: 0, to: 13) }
    property_constructed_year { Faker::Number.between(from: 0, to: 100) }
    property_address { Faker::Lorem.sentence(word_count: 5) }
    user_email { Faker::Internet.email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    first_name_kana { 'にかこ' }
    last_name_kana { 'せんだい' }
    user_tel { '0000000000' }
  end
end
