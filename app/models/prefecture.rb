class Prefecture < ApplicationRecord
  has_many :cities, dependent: :restrict_with_exception

  validates :name, uniqueness: true
end
