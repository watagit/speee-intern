# frozen_string_literal: true

class Prefecture < ApplicationRecord
  has_many :cities
end
