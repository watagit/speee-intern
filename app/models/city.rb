class City < ApplicationRecord
  has_many :reviews
  belongs_to :prefecture
  has_many :branches, through: :available_areas
end
