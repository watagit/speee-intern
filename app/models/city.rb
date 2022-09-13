class City < ApplicationRecord
  belongs_to :prefecture
  has_many :reviews, dependent: :restrict_with_exception
  has_many :available_areas, dependent: :restrict_with_exception
  # 中間テーブルを介した関連付け
  has_many :branches, class_name: 'Branch', through: :available_areas
  # 中間テーブルを介さない関連付け
  has_many :branch_cities, class_name: 'Branch', dependent: :restrict_with_exception
end
