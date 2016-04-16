require 'rails_helper'

describe "Creating a new review" do
  it "allows writing reviews from Share page" do
    share1 = Share.create(shares_data)

    visit share_url(share1)

   
    select 1, :from => "review_priority"
    fill_in "Comment", with: "I love this share!"
    fill_in "review_name", with: "Robin"
    click_button 'Post Review'

    expect(page).to have_text("Review saved!")
   
    expect(current_path).to eq(share_reviews_path(share1))

    expect(page).to have_text("I love this share!")
    
  end

  it "allows writing reviews from reviews page" do
   
    share1 = Share.create(shares_data)
    visit share_reviews_path(share1)
    
    select 1, :from => "review_priority"
    fill_in "Comment", with: "I love this share!"
    fill_in "review_name", with: "Robin"
    click_button 'Post Review'

    expect(page).to have_text("Review saved!")

    expect(current_path).to eq(share_reviews_path(share1))

    expect(page).to have_text("I love this share!")
    

    expect {
      click_button 'Post Review'
    }.not_to change(Review, :count)

    
  end

  it " does not allow writing invalid reviews from reviews page" do
   
    share1 = Share.create(shares_data)
    visit share_reviews_url(share1)
    
    select 1, :from => "review_priority"
    fill_in "Comment", with: ""
    fill_in "review_name", with: "Robin"

    expect {
      click_button 'Post Review'
    }.not_to change(Review, :count)

    expect(page).to have_text('Error')
  end

  it " does not allow writing invalid reviews from share page" do
   
    share1 = Share.create(shares_data)
    visit share_url(share1)
    fill_in "review_name", with: "Robin"
    select 1, :from => "review_priority"
    fill_in "Comment", with: ""

    expect {
      click_button 'Post Review'
    }.not_to change(Review, :count)

    expect(page).to have_text('Error')
  end

end
