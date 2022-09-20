class CitiesController < ApplicationController
  def show
    @city = City.find(params[:id])
    @prefecture = @city.prefecture
    branch_ids = AvailableArea.where(city_id: @city.id).pluck(:branch_id)
    @city_branches = Branch.where(id: branch_ids).eager_load(:company, :city).sort do |a, b|
      b.average_satisfaction_level <=> a.average_satisfaction_level
    end
  end
end
