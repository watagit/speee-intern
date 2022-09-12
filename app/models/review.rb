class Review < ApplicationRecord
  belongs_to :branch
  belongs_to :city
  has_many :property_types
end
