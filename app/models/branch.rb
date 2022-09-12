class Branch < ApplicationRecord
  belongs_to :company
  has_many :reviews, dependent: :destroy
end
