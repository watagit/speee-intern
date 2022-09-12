class Branch < ApplicationRecord
  belongs_to :company
  has_many :reviews, dependent: :destroy
  has_many :cities, through: :available_areas
end
