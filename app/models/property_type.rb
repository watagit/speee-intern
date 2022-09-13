class PropertyType < ApplicationRecord
  has_many :reviews, dependent: :restrict_with_exception
end
