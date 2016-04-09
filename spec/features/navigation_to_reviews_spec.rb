require "spec_helper"
require "rails_helper"

describe "Navigating to reviews" do
  
  it "takes to reviews from Share page" do
    share1 = Share.create(shares_data)
    review1 = share1.reviews.create(review_attributes(name: "H", comment: "Testing..."))
    review2 = share1.reviews.create(review_attributes(name: "S"))
    visit share_url(share1)

    click_link "Reviews"
    expect(current_path).to eq(share_reviews_url(share1))
    expect(page).to have_text(review1.comment)
  end
end