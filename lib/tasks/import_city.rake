require 'csv'

desc "市区町村データをインポート"
task import_city: :environment do
  CSV.foreach("db/csv_data/city.csv", headers: true) do |row|
    city_id = row["id"]
    prefecture_id = row["prefecture_id"]
    city_name = row["name"]

    ActiveRecord::Base.transaction do
      City.create!(id: city_id, prefecture_id: prefecture_id, name: city_name)
    end
  end
rescue ActiveRecord::RecordInvalid => e
  logger.error e.message
  logger.error e.backtrace.join("\n")
ensure
  puts '市区町村データのインポート完了!'
end