class PropertyType < ApplicationRecord
  has_many :reviews, dependent: :nullify
end
