class HomeController < ApplicationController
  def index
    @offers = Offer.all_ordered
  end
end
