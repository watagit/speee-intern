class AssessmentForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :ieul_branch_id
  attribute :property_city
  attribute :property_type
  attribute :property_exclusive_area
  attribute :property_land_area
  attribute :property_building_area
  attribute :property_building_area_unit
  attribute :property_floor_area
  attribute :property_room_plan
  attribute :property_constructed_year
  attribute :property_address
  attribute :user_email
  attribute :first_name
  attribute :last_name
  attribute :first_name_kana
  attribute :last_name_kana
  attribute :user_tel

  with_options presence: true do
    with_options numericality: { only_integer: true } do
      validates :ieul_branch_id
      validates :property_city
      validates :property_type
      validates :property_exclusive_area
      validates :property_land_area
      validates :property_building_area
      validates :property_building_area_unit
      validates :property_floor_area
      validates :property_room_plan
      validates :property_constructed_year
    end

    validates :property_address
    validates :user_email, length: { maximum: 100 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    validates :first_name, length: { maximum: 15 }
    validates :last_name, length: { maximum: 15 }
    validates :first_name_kana, length: { maximum: 31 }
    validates :last_name_kana, length: { maximum: 31 }
    validates :user_tel, format: { with: /\A0\d{9,10}\z/ }
  end
end
