# frozen_string_literal: true

class Review < ApplicationRecord
  extend Enumerize

  belongs_to :branch
  belongs_to :city
  belongs_to :property_type

  validates :review_digest, uniqueness: true

  enumerize :brokerage_contract_type,
            in: { privilegedand_exclusive_brokerage_service_agreement: 1, exclusive_brokerage_service_agreement: 2,
                  non_exclusive_brokerage_service_agreement: 3, unknown: 4 }
  enumerize :reason_for_sale,
            in: { relocation: 1, inheritance: 2, transfer: 3, divorce: 4, assets_management: 5, financial_reason: 6,
                  other: 99 }
end
