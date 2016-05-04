class ReviewsController < ApplicationController
	
	before_action :set_share
	
	# This is the controller method responsible for displaying all the reviews for a share
	def index
		@reviews = @share.reviews.order(priority: :asc)
		@reviewToAlter = @share.reviews.new
	end

	#this method takes care of creating new reviews
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

	#edit is the method which takes care of editing a review
	def edit
		@reviews = @share.reviews.order(priority: :asc)
		@reviewToAlter = Review.find(params[:id])
	end

	#update routine updates a modified review. If the review is successfully modified, User will be notified using flash
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

	#destroy method takes care of deleting a review
	def destroy
		@review = Review.find(params[:id])
		@review.destroy
		redirect_to share_reviews_path(@share), notice: "Review successfully deleted!"		
	end



 private
	#review_params lists all the permitted parameters for review table
	def review_params
		params.require(:review).permit(:name, :priority, :comment)
	end

	#this method is called by "before_action" and it sets the @share parameter for all the other methods
	def set_share
  		@share = Share.find(params[:share_id])
	end
end
