class FeedController < ApplicationController
  def show
    @listings = Listing.feed.first(10)
  end
end
