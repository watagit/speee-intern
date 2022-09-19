class Branch < ApplicationRecord
  belongs_to :company
  belongs_to :city
  has_many :available_areas, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :cities, through: :available_areas

  validates :ieul_branch_id, uniqueness: true
  validates :name, uniqueness: { scope: %i[company_id ieul_branch_id] }
end
