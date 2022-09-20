class PrefecturesController < ApplicationController
  def show
    @prefecture = Prefecture.find(params[:id])

    branch_ids = AvailableArea.where(city_id: @prefecture.cities.ids).pluck(:branch_id)
    @prefecture_branches = Branch.where(id: branch_ids).eager_load(:reviews, :city, :company)
  end

  def city
    prefecture = Prefecture.find(params[:id])
    render json: prefecture.cities
  end
end
