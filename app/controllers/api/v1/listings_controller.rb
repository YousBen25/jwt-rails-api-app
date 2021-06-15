class Api::V1::ListingsController < ApplicationController
  def index
    @listings = Listing.all
    render json: @listings
  end

  def create
    @listing = Listing.new(listing_params)
    # listing.user = User.find(params[:id])
    if @listing.save
      render json: @listing
    else
      render json: {error: 'process not completed'}
    end
  end

  private

  def listing_params
    params.permit(:title, :price, :description, :category_id, :user_id, :image, :location)
  end
end
