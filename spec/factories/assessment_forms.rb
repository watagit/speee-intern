FactoryBot.define do
  factory :assessment_form do
    ieul_branch_id: 1
    property_city: 264
    property_type: 4
    property_exclusive_area: 10
    property_land_area: 20
    property_building_area: 10
    property_building_area_unit: 0
    property_floor_area: 8
    property_room_plan: 1
    property_constructed_year: 35
    property_address: '連坊一丁目4-1'
    user_email: 'nika@example.com'
    first_name: '二華子'
    last_name: '仙台'
    first_name_kana: 'にかこ'
    last_name_kana: 'せんだい'
    user_tel: '0000000000'
  end
end
