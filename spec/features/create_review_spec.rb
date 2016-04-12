require 'rails_helper'

describe "Creating a new review" do
  it "allows writing reviews from Share page" do
    share1 = Share.create(shares_data)

    visit share_url(share1)

    fill_in "Name", with: "Robin"
    select 1, :from => "review_priority"
    fill_in "Comment", with: "I love this share!"

    click_button 'Post Review'

    expect(current_path).to eq(share_reviews_path(share1))

    expect(page).to have_text("I love this share!")
    expect(page).to have_text("Review saved!")
  end

  it "allows writing reviews from reviews page" do
   
    share1 = Share.create(shares_data)
    visit share_reviews_url(share1)
    fill_in "Name", with: "Robin"
    select 1, :from => "review_priority"
    fill_in "Comment", with: "I love this share!"

    click_button 'Post Review'

    expect(current_path).to eq(share_reviews_path(share1))

    expect(page).to have_text("I love this share!")
    expect(page).to have_text("Review saved!")

    expect {
      click_button 'Post Review'
    }.not_to change(Review, :count)

    expect(page).to have_text('error')
  end

  it " does not allow writing invalid reviews from reviews page" do
   
    share1 = Share.create(shares_data)
    visit share_reviews_url(share1)
    fill_in "Name", with: "Robin"
    select 1, :from => "review_priority"
    fill_in "Comment", with: ""

    expect {
      click_button 'Post Review'
    }.not_to change(Review, :count)

    expect(page).to have_text('error')
  end

  it " does not allow writing invalid reviews from share page" do
   
    share1 = Share.create(shares_data)
    visit share_url(share1)
    fill_in "Name", with: "Robin"
    select 1, :from => "review_priority"
    fill_in "Comment", with: ""

    expect {
      click_button 'Post Review'
    }.not_to change(Review, :count)

    expect(page).to have_text('error')
  end

end
