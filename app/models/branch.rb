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
      total_rating += review.satisfaction_level
    end

    # TODO: 小数点第2位以下は切り捨てで良いかりょうさんに確認
    (Float(total_rating) / reviews.count).round(2)
  end
end
