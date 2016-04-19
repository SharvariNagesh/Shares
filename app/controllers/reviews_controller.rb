class ReviewsController < ApplicationController
	
	before_action :set_share
	
	def index
		@reviews = @share.reviews.order(priority: :asc)
		@reviewToAlter = @share.reviews.new
	end

	def create
		@reviews = @share.reviews.order(priority: :asc)
		@reviewToAlter = @share.reviews.new(review_params)
		
		if @reviewToAlter.save
			redirect_to share_reviews_path(@share), notice: "Review saved!"
		else
			flash[:alert] = "Error : #{@reviewToAlter.errors.full_messages.to_sentence}"
			render :index
		end
	end

	def edit
		@reviews = @share.reviews.order(priority: :asc)
		@reviewToAlter = Review.find(params[:id])
	end

	def update
		@reviews = @share.reviews.order(priority: :asc)
		@reviewToAlter = Review.find(params[:id])
		@review = Review.find(params[:id])
		if @review.update(review_params)
			redirect_to share_reviews_path(@share), notice: 'Review successfully updated!'
		else
			flash[:alert] = "Error : #{@review.errors.full_messages.to_sentence}"
			render :edit
		end
	end

	def destroy
		@review = Review.find(params[:id])
		@review.destroy
		redirect_to share_reviews_path(@share), notice: "Review successfully deleted!"		
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
