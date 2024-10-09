class ListingsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :load_listings, except: [:new, :create]

  def new
    @listing = Listing.new
    @organizations = current_user.organizations
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.creator = current_user
    
    if current_user.organizations.empty?
      organization = Organization.create(@user)

      current_user.organizations << organization

    end

    @listing.organization = current_user.organizations.first
    if @listing.save
      
      redirect_to listing_path(@listing), flash: {success: t(".sucess")}, status: :see_other
    else
      # Rails.logger.debug "Listing creation failed: #{@listing.errors.full_messages.join(', ')}"
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @listing.update(listing_params)
      redirect_to listing_path(@listing), status: :see_other, flash: { sucess: t(".sucess")}
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @listing.destroy
    redirect_to root_path, status: :see_other, flash: { sucess: t(".sucess")}
  end

  private

  def listing_params
    params.require(:listing).permit(:title, :price, :condition, tags: [])
  end

  def load_listings
    @listing = Listing.find(params[:id])
  end
end
