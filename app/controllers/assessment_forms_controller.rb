class AssessmentFormsController < ApplicationController
  def new; end

  def create
    @assessment_form = AssessmentForm.new(assessment_form_params)
    # rubocop:disable Rails/I18nLocaleTexts
    if @assessment_form.valid?
      redirect_to thanks_path
    else
      flash.now[:alert] = '査定情報の送信に失敗しました'
      render action: :new, status: :unprocessable_entity
    end
    # rubocop:enable Rails/I18nLocaleTexts
  end

  private

  # rubocop:disable  Metrics/MethodLength

  def assessment_form_params
    params.permit(
      :branch_id,
      :prefecture_id,
      :city_id,
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
  # rubocop:enable Metrics/MethodLength
end
