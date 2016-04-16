class ReviewsController < ApplicationController
	
	before_action :set_share
	
	def index
		@reviews = @share.reviews.order(priority: :asc)
		@newReview = @share.reviews.new
	end

	def create
		@reviews = @share.reviews.order(priority: :asc)
		@newReview = @share.reviews.new(review_params)
		
		if @newReview.save
			redirect_to share_reviews_path(@share), notice: "Review saved!"
		else
			flash[:alert] = "Error : #{@newReview.errors.full_messages.to_sentence}"
			render :index
		end
	end


 private
	def review_params
		params.require(:review).permit(:name, :priority, :comment)
	end

	def review_permit

	end

	def set_share
  		@share = Share.find(params[:share_id])
	end
end
