5.times do |i|
  Company.create(
    name:       "#{i}不動産",
    logo_url:   "https://foodslink.jp/syokuzaihyakka/syun/fruit/abricotto/anzu21s.jpg",
    catch_copy: "#{i}不動産のキャッチコピー",
  )
end

5.times do |i|
  Prefecture.create!(
    name: "都道府県#{i}"
  )
end

5.times do |i|
  prefecture = Prefecture.first
  prefecture.cities.create!(
    name: "市町村#{i}",
  )
end

5.times do |i|
  company = Company.first
  city = City.first
  company.branches.create!(
    name:           "#{i}支店",
    zip_code:       "329-1224",
    phone_number:   "00-0000-0000",
    fax_number:     "00-0000-0000",
    business_hours: "平日9:00～18:00",
    closed_day:     "水曜日、祝日、GW、他",
    introduction:   "Speee1不動産港区支店にお任せください！東京都の不動産売却の実績多数です。",
    after_address:  "#{i}丁目",
    city_id: city.id
  )
end
