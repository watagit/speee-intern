FactoryBot.define do
  factory :company do
    name { Faker::Company.name }
    logo_url { 'https://foodslink.jp/syokuzaihyakka/syun/fruit/abricotto/anzu21s.jpg' }
    catch_copy { Faker::Lorem.sentence(word_count: 10) }
    ieul_company_id { 1 }
  end
end
