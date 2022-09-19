# frozen_string_literal: true

class Company < ApplicationRecord
  has_many :branches, dependent: :destroy

  validates :ieul_company_id, uniqueness: true
  validates :name, uniqueness: { scope: :ieul_company_id }
end
