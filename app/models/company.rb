class Company < ApplicationRecord
  has_many :branches, dependent: :destroy
end
