class BranchesController < ApplicationController
  def show
    @branch = Branch.find(params[:id])
    @branch_reviews = @branch.reviews.order(sold_at: 'DESC')
  end
end
