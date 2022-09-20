FactoryBot.define do
  factory :city do
    name { Faker::Address.city }

    association :prefecture
  end
end
