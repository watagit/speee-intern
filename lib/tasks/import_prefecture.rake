require 'csv'

desc "都道府県データをインポート"
task import_prefecture: :environment do
  CSV.foreach("db/csv_data/prefecture.csv", headers: true) do |row|
    prefecture_name = row["name"]

    ActiveRecord::Base.transaction do
      Prefecture.create!(name: prefecture_name)
    end
  end
rescue ActiveRecord::RecordInvalid => e
  logger.error e.message
  logger.error e.backtrace.join("\n")
end