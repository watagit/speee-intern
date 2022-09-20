FactoryBot.define do
  factory :city do
    name { '港区' }
    
    association :prefecture
  end
end
