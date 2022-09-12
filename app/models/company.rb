# frozen_string_literal: true

class Company < ApplicationRecord
  has_many :branches, dependent: :destroy
end
