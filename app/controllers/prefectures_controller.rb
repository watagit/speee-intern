class PrefecturesController < ApplicationController
  def city
    prefecture = Prefecture.find(params[:id])
    render json: prefecture.cities
  end
end
