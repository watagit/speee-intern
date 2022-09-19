class CitiesController < ApplicationController
  def show
    @city = City.find(params[:id])
    @prefecture = @city.prefecture
    branch_ids = AvailableArea.where(city_id: @city.id).pluck(:branch_id)
    @city_branches = Branch.where(id: branch_ids)
  end
end
