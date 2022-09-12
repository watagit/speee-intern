module BranchesHelper
  def format_price(price)
    price /= 10000

    # FIXME: price.to_s(:delimited)を使いたかったが動かなかった
    "#{price.to_s.gsub(/(\d)(?=\d{3}+$)/, '\\1,')}万円"
  end

  def format_date(date)
    # "2022-09-12" => "2022年9月" に変換
    date.strftime("%Y年%-m月")
  end
end
