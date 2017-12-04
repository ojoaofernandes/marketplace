class HomeController < ApplicationController
  def index
    if params[:category].present?
      @offers = Offer.where(category: params[:category])
    elsif params[:search].present?
      @offers = Offer.where("title || ' ' || description ILIKE ?", "%#{params[:search]}%")
    else
      @offers = Offer
    end

    @offers = @offers.all_ordered
    @categories = Offer.select(:category).distinct
  end
end
