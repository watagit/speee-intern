class HomeController < ApplicationController
  def show
    @hokkaidotohoku = Prefecture.where(id: 1..7)
    @kanto = Prefecture.where(id: 8..14)
    @chubu = Prefecture.where(id: 15..23)
    @kinki = Prefecture.where(id: 24..30)
    @chugoku = Prefecture.where(id: 31..35)
    @shikoku = Prefecture.where(id: 36..39)
    @kyusyuokinawa = Prefecture.where(id: 40..47)
  end
end
