class Review < ApplicationRecord
  belongs_to :branch
  belongs_to :city
end
