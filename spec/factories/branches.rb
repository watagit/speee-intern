FactoryBot.define do
  factory :branch do
    name { '港区支店' }
    zip_code { Faker::Address.zip_code }
    phone_number { Faker::PhoneNumber.phone_number }
    fax_number { Faker::PhoneNumber.phone_number }
    business_hours { '平日9:00～18:00' }
    closed_day { '水曜日、祝日、GW、他' }
    introduction { Faker::Lorem.sentence(word_count: 10) }
    after_address { Faker::Address.street_address }
    ieul_branch_id { 1 }

    association :company
    association :city
  end
end
