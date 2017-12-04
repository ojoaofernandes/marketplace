class HomeController < ApplicationController
  def index
    @categories = Offer.select(:category).distinct
    @offers = Offer.all_ordered
  end
end
