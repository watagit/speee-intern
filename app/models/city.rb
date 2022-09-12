class City < ApplicationRecord
  has_many :reviews
  belongs_to :prefecture
  has_many :branches, through: :available_areas
  # TODO: 1つのモデルに対して複数のhas_manyを指定する場合の関連付けを正しくする
  has_many :branches
end
