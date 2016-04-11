require "spec_helper"
require "rails_helper"

describe "Vieweing details of a share" do
	it "Viewing Individual Share detail" do
		share1 = Share.create(shares_data)

    	visit share_url(share1)
		
		expect(page).to have_text(share1.name)
		expect(page).to have_text(share1.book_value)
    	expect(page).to have_text(share1.current_price)
    	expect(page).to have_text(share1.current_PE_ratio)
    	expect(page).to have_text(share1.market_cap)
    	expect(page).to have_text(share1.price_to_book_value)
    	expect(page).to have_text(share1.description)
   	# expect(page).not_to have_text(share2.name)
	end

	it "Contains reviews for the share" do
		share1 = Share.create(shares_data)
		review1 = share1.reviews.new(review_attributes)
		review2 = share1.reviews.new(review_attributes(priority:3))
    	visit share_url(share1)
    	expect(page).to have_text(review1.comment)
		expect(page).to have_text(review2.comment)
	end

	it "Contains top 3 reviews sorted with priority" do
		share1 = Share.create(shares_data)
		review1 = share1.reviews.new(review_attributes(priority:1))
		review2 = share1.reviews.new(review_attributes(priority:1))
		review3 = share1.reviews.new(review_attributes(priority:1))
		review4 = share1.reviews.new(review_attributes(priority:3))
    	visit share_url(share1)
    	expect(page).to have_text(review1.comment)
		expect(page).to have_text(review2.comment)
		expect(page).to have_text(review3.comment)
		expect(page).not_to have_text(review4.comment)
	end


end