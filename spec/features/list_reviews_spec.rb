require "spec_helper"
require "rails_helper"

describe "Viewing a list of reviews" do
  
  it "shows the reviews for a specific Share" do
    share1 = Share.create(shares_data)
    review1 = share1.reviews.create(review_attributes(name: "H", comment: "Testing..."))
    review2 = share1.reviews.create(review_attributes(name: "S"))


    visit share_reviews_url(share1)
        
    expect(page).to have_text(review1.name)
    expect(page).to have_text(review2.name)
    expect(page).to have_text(review1.comment)
  end
end