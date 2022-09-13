class Prefecture < ApplicationRecord
  has_many :cities, dependent: :nullify
end
