require "spec_helper"
require "rails_helper"

describe "Deleting a Review" do
	it "deletes the review and lists the reviews without the deleted review" do

		share = Share.create(shares_data)
        review = share.reviews.create(review_attributes(name: "Hemanth", comment: "Testing..."))
        visit share_reviews_url(share)
        
    	expect(page).to have_text(review.name)
    	click_link "delete_#{review.id}"

        expect(current_path).to eq(share_reviews_path(share))
        expect(page).not_to have_text(review.name)
    end
end