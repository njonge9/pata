class MyListingsController < ApplicationController
    def show
        @pagy, @listings = pagy(current_user.organizations.first.listings)
    end

    def destroy
        @listing.destroy
        flash[:sucess] = t(".success")
        redirect_to my_listings_path, status: :see_other
    end
end
