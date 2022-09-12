class City < ApplicationRecord
  has_many :reviews
  belongs_to :prefecture
end
