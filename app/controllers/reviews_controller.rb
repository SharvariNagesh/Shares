class ReviewsController < ApplicationController

	def index
		@share = Share.find(params[:share_id])
		@reviews = @share.reviews
	end
end
