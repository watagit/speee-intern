# frozen_string_literal: true

class City < ApplicationRecord
  belongs_to :prefecture
  has_many :reviews
  has_many :available_areas
  # 中間テーブルを介した関連付け
  has_many :branches, class_name: 'Branch', through: :available_areas
  # 中間テーブルを介さない関連付け
  has_many :branch_cities, class_name: 'Branch'
end
