class AssessmentFormsController < ApplicationController
  def new
    @assessment_form = AssessmentForm.new
    @ieul_branch_id = params[:ieul_branch_id]
  end

  def create
    @assessment_form = AssessmentForm.new(assessment_form_params)
    if @assessment_form.valid? && post_assessment(assessment_form_params)
      redirect_to thanks_path
    else
      flash.now[:alert] = '査定情報の送信に失敗しました'
      render action: :new, status: :unprocessable_entity
    end
  end

  private

  # rubocop:disable  Metrics/*

  def assessment_form_params
    params.permit(
      :ieul_branch_id,
      :property_city,
      :property_type,
      :property_exclusive_area,
      :property_land_area,
      :property_building_area,
      :property_building_area_unit,
      :property_floor_area,
      :property_room_plan,
      :property_constructed_year,
      :property_address,
      :user_email,
      :first_name,
      :last_name,
      :first_name_kana,
      :last_name_kana,
      :user_tel
    )
  end

  def post_assessment(params)
    api_params = {
      branch_id: params[:ieul_branch_id],
      property_city: params[:property_city],
      property_address: params[:property_address],
      property_type: params[:property_type],
      property_exclusive_area: params[:property_exclusive_area],
      property_land_area: params[:property_land_area],
      property_building_area: params[:property_building_area],
      property_building_area_unit: params[:property_building_area_unit],
      property_floor_area: params[:property_floor_area],
      url_param: 'https://ouchi-satei-navi.jp',
      property_room_plan: params[:property_room_plan],
      property_constructed_year: params[:property_constructed_year],
      user_email: params[:user_email],
      user_name: "#{params[:last_name]} #{params[:first_name]}",
      user_name_kana: "#{params[:last_name_kana]} #{params[:first_name_kana]}",
      user_tel: params[:user_tel]
    }
    uri = URI.parse('https://miniul-api.herokuapp.com/affiliate/v2/conversions')
    response = Net::HTTP.post_form(uri, api_params)

    response.code == '200'
  end
  # rubocop:enable Metrics/*
end
