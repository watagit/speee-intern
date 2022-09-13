module ReviewsHelper
  # 価格をフォーマットする
  # 例）20000000 => 2,000万円
  def format_price(price)
    price /= 10000
    "#{number_with_delimiter(price, delimiter: ',')}万円"
  end

  # 日付をフォーマットする
  # 例）2022-09-12 => 2022年9月
  def format_date(date)
    date.strftime("%Y年%-m月")
  end
end
