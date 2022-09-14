require 'csv'

desc '口コミデータを作成'
task import_review: :environment do
  CSV.foreach('db/csv_data/review.csv', headers: true) do |row|
    branch_id = row['ieul_店舗id']
    user_name = row['名前']
    gender = row['性別']
    age = row['年齢']
    city_name = row['市区町村']
    csv_property_type = ['物件種別']
    sell_count = row['売却回数']
    considering_selling_at = row['売却検討時期']
    assessment_requested_at = row['査定依頼時期']
    sales_started_at = row['売出時期']
    sold_at = row['売却時期']
    delivered_at = row['引渡時期']
    assessment_price = row['査定価格']
    sold_price = row['販売価格']
    discount = row['値下げしたかどうか']
    discount_date_type_after_sales_started = row['売り出してから何ヶ月後に値下げしたか']
    discount_price = row['値下げ価格']
    contract_price = row['成約価格']
    brokerage_contract_type = row['媒介契約の形態']
    headline = row['見出し']
    reason_for_sale = row['売却理由']
    comment_anxiety = row['売却時に不安だったこと']
    comment_reason_to_decide = row['この会社に決めた理由']
    satisfaction_level = row['不動産会社の対応満足度']
    comment_reason_for_satisfaction = row['不動産会社の対応満足度の理由']
    advice = row['今後売却する人へのアドバイス']
    comment_improvement = row['不動産会社に改善してほしい点']

    ActiveRecord::Base.transaction do
      property_type = PropertyType.find_or_create_by(name: csv_property_type)
      city = City.find_by(name: city_name)
      is_discount = discount.to_i == 0 ? false : true

      Review.create!(
        name: user_name,
        gender: gender,
        age: age,
        sell_count: sell_count,
        considering_selling_at: considering_selling_at,
        assessment_requested_at: assessment_requested_at,
        sales_started_at: sales_started_at,
        sold_at: sold_at,
        delivered_at: delivered_at,
        assessment_price: assessment_price,
        sold_price: sold_price,
        is_discount: is_discount,
        discount_date_type_after_sales_started: discount_date_type_after_sales_started,
        discount_price: discount_price,
        brokerage_contract_type: brokerage_contract_type,
        headline: headline,
        reason_for_sale: reason_for_sale,
        comment_anxiety: comment_anxiety,
        comment_reason_to_decide: comment_reason_to_decide,
        satisfaction_level: satisfaction_level,
        comment_reason_for_satisfaction: comment_reason_for_satisfaction,
        advice: advice,
        comment_improvement: comment_improvement,
        property_type_id: property_type.id,
        city_id: city.id,
        branch_id: branch_id,
        contract_price: contract_price
      )
    end
  end
rescue => e
  logger.error e.message
  logger.error e.backtrace.join("\n")
end
