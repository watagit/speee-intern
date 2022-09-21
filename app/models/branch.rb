class Branch < ApplicationRecord
  belongs_to :company
  belongs_to :city
  has_many :available_areas, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :cities, through: :available_areas

  validates :ieul_branch_id, uniqueness: true
  validates :name, uniqueness: { scope: %i[company_id ieul_branch_id] }

  # 平均評価の算出
  def average_satisfaction_level
    total_rating = 0

    reviews.each do |review|
      total_rating += review[:satisfaction_level]
    end

    result = (Float(total_rating) / reviews.length).round(1)

    if result.nan?
      0
    else
      result
    end
  end
end
