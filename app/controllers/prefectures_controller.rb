class PrefecturesController < ApplicationController
  def show
    @prefecture = Prefecture.find(params[:id])
  end

  def city
    prefecture = Prefecture.find(params[:id])
    render json: prefecture.cities
  end
end
