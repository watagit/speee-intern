class AssessmentFormsController < ApplicationController
  def new
    @assessment_form = AssessmentForm.new
    @ieul_branch_id = params[:ieul_branch_id]
  end

  def create # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
    @assessment_form = AssessmentForm.new(assessment_form_params)

    api_params = generate_params(assessment_form_params)
    @city = City.find_by(id: @assessment_form.property_city)

    if @assessment_form.valid?
      @branch = Branch.find_by(ieul_branch_id: @assessment_form.ieul_branch_id)
      available_area_ids = @branch.available_areas.pluck(:city_id)
      if available_area_ids.include?(@assessment_form.property_city.to_i)
        post_assessment(api_params)
        redirect_to thanks_path
      elsif @city.available_areas.size.positive?
        flash[:alert] = t 'assessment_forms.flash.cannot_assess'
        redirect_to @city
      else
        flash[:alert] = t 'assessment_forms.flash.not_found'
        redirect_to @city
      end
    else
      @ieul_branch_id = params[:assessment_form][:ieul_branch_id]
      flash.now[:alert] = t 'assessment_forms.flash.failed_to_send'
      render action: :new, status: :unprocessable_entity
    end
  end

  private

  # rubocop:disable  Metrics/*

  def assessment_form_params
    params.require(:assessment_form).permit(
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

  def generate_params(params)
    {
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
  end

  def post_assessment(params)
    uri = URI.parse('https://miniul-api.herokuapp.com/affiliate/v2/conversions')
    response = Net::HTTP.post_form(uri, params)

    response.code == '200'
  end
  # rubocop:enable Metrics/*
end
