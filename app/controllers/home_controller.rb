class HomeController < ApplicationController
  def show
    @prefectures = Prefecture.all
  end
end
