module Api
  class PrefecturesController < ApplicationController
    def show
      prefecture = Prefecture.find(params[:id])
      render json: prefecture.cities
    end
  end
end
