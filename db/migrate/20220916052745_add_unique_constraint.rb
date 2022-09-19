class AddUniqueConstraint < ActiveRecord::Migration[7.0]
  def up
    add_index  :prefectures, [:name], unique: true
    add_index  :cities, [:prefecture_id, :name], unique: true
    add_index  :available_areas, [:city_id, :branch_id], unique: true
    add_index  :branches, [:name, :company_id, :ieul_branch_id], unique: true
    add_index  :branches, [:ieul_branch_id], unique: true
    add_index  :companies, [:name, :ieul_company_id], unique: true
    add_index  :companies, [:ieul_company_id], unique: true
    add_index  :reviews, [:review_digest], unique: true
  end
  def down
    remove_index  :prefectures, [:name], unique: true
    remove_index  :cities, [:prefecture_id, :name], unique: true
    remove_index  :available_areas, [:city_id, :branch_id], unique: true
    remove_index  :branches, [:name, :company_id, :ieul_branch_id], unique: true
    remove_index  :branches, [:ieul_branch_id], unique: true
    remove_index  :companies, [:name, :ieul_company_id], unique: true
    remove_index  :companies, [:ieul_company_id], unique: true
    remove_index  :reviews, [:review_digest], unique: true
  end
end

