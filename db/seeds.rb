5.times do |i|
  Company.create(
    name: "#{i}不動産",
    logo_url: 'https://foodslink.jp/syokuzaihyakka/syun/fruit/abricotto/anzu21s.jpg',
    catch_copy: "#{i}不動産のキャッチコピー"
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
    name: "市町村#{i}"
  )
end

5.times do |i|
  company = Company.first
  city = City.first
  company.branches.create!(
    name: "#{i}支店",
    zip_code: '329-1224',
    phone_number: '00-0000-0000',
    fax_number: '00-0000-0000',
    business_hours: '平日9:00～18:00',
    closed_day: '水曜日、祝日、GW、他',
    introduction: 'Speee1不動産港区支店にお任せください！東京都の不動産売却の実績多数です。',
    after_address: "#{i}丁目",
    city_id: city.id
  )
end

3.times do |i|
  PropertyType.create!(
    name: "物件種別#{i}"
  )
end

5.times do |i|
  city = City.first
  property_type = PropertyType.first
  branch = Branch.first

  branch.reviews.create!(
    name: "レビュー#{i + 1}",
    gender: '男性',
    age: 40,
    sell_count: '初めて',
    considering_selling_at: '2018-02-14',
    assessment_requested_at: '2018-03-14',
    sales_started_at: '2018-03-14',
    sold_at: '2019-01-14',
    delivered_at: '2019-07-31',
    assessment_price: 22_000_000,
    sold_price: 22_500_000,
    is_discount: 1,
    discount_date_type_after_sales_started: 3,
    discount_price: 500_000,
    brokerage_contract_type: 2,
    headline: '港区：担当者の対応が良かったです。',
    reason_for_sale: 5,
    comment_anxiety: '港区品川：山路（やまみち）を登りながら、こう考えた。知に働けば角が立つ。情に棹させば流される。意地を通せば窮屈だ。とかくに人の世は住みにくい。' \
                     '住みにくさが高じると、安いところへ引き越したくなる。どこへ越しても住みにくいと悟った時、詩が生まれて、画ができる。',
    comment_reason_to_decide: '港区品川：吾輩は猫である。名前はまだ無い。どこで生れたかとんと見当がつかぬ。何でも薄暗いじめじめした所でニャーニャー泣いていた事だけは記憶している。' \
                              '吾輩はここで始めて人間というものを見た。しかもあとで聞くとそれ',
    satisfaction_level: 5,
    comment_reason_for_satisfaction: '港区品川：恥の多い生涯を送って来ました。自分には、人間の生活というものが、見当つかないのです。' \
                                     '自分は東北の田舎に生れましたので、汽車をはじめて見たのは、よほど大きくなってからでした。自分は停車場のブリッジを、上',
    advice: '港区品川：木曾路はすべて山の中である。あるところは岨づたいに',
    comment_improvement: '折返しの連絡が無かったり、遅かったりすることがあったこと。',
    property_type_id: property_type.id,
    city_id: city.id
  )
end
