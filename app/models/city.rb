class City < ApplicationRecord
  has_many :reviews
  belongs_to :prefecture
  # 中間テーブルを介した関連付け
  has_many :branches, class_name: "Branch", through: :available_areas
  # 中間テーブルを介さない関連付け
  has_many :branch_cities, class_name: "Branch", foreign_key: "city_id"
end
