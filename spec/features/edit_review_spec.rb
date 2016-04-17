require "spec_helper"
require "rails_helper"

describe "Editing a review" do

  it "updates the review and shows the review's updated details" do
    share = Share.create(shares_data)
    review = share.reviews.create(review_attributes(name: "H", comment: "Testing..."))
    review_id = review.id
    visit share_reviews_path(share)

    click_link "Edit_#{review_id}"

    expect(current_path).to eq(edit_share_review_path(share,review))

    expect(find_field('review_name').value).to eq(review.name)

    fill_in 'review_name', with: "Changed Name"

    click_button 'Update Review'

    expect(current_path).to eq(share_reviews_path(share))

    expect(page).to have_text('Changed Name')
  end


  it "does not updates the review if invalid data is entered" do
    share = Share.create(shares_data)
    review = share.reviews.create(review_attributes(name: "H", comment: "Testing..."))
    review_id = review.id
    visit share_reviews_path(share)

    click_link "Edit_#{review_id}"

    expect(current_path).to eq(edit_share_review_path(share,review))

    expect(find_field('review_name').value).to eq(review.name)

    fill_in 'review_name', with: ""

    click_button 'Update Review'

    expect(page).to_not have_text('Changed Name')
    expect(page).to have_text("Error")
  end
end
