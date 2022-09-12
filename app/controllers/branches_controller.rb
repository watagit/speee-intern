class BranchesController < ApplicationController
  def show
    @branch = Branch.find(params[:id])
  end
end
