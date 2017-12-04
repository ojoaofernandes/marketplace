class OffersController < ApplicationController
  before_action :authenticate_user!, except: :show
  before_action :set_offer, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  skip_load_and_authorize_resource only: :show

  # GET /offers
  # GET /offers.json
  def index
    @offers = Offer.where user_id: current_user.id
  end

  # GET /offers/1
  # GET /offers/1.json
  def show
    @offer.increment!(:view_count)
    @offers = Offer.where(category: @offer.category).where.not(id: @offer.id).all_ordered
  end

  # GET /offers/new
  def new
    @offer = Offer.new
  end

  # GET /offers/1/edit
  def edit
  end

  # POST /offers
  # POST /offers.json
  def create
    @offer = Offer.new(offer_params)
    @offer.user_id = current_user.id

    respond_to do |format|
      if @offer.save
        format.html { redirect_to offer_path @offer, notice: 'Offer was successfully created.' }
        format.json { render :show, status: :created, location: @offer }
      else
        format.html { render :new }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offers/1
  # PATCH/PUT /offers/1.json
  def update
    respond_to do |format|
      if @offer.update(offer_params)
        format.html { redirect_to offer_path @offer, notice: 'Offer was successfully updated.' }
        format.json { render :show, status: :ok, location: @offer }
      else
        format.html { render :edit }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offers/1
  # DELETE /offers/1.json
  def destroy
    @offer.destroy
    respond_to do |format|
      format.html { redirect_to offers_url, notice: 'Offer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer
      @offer = Offer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def offer_params
      params.require(:offer).permit(:title, :category, :price, :description, {photos: []}, :photos_cache, :remove_photos)
    end
end
