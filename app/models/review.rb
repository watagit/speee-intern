class Review < ApplicationRecord
  belongs_to :branch
  belongs_to :city
  belongs_to :property_type
end
