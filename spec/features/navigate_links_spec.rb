describe "Navigation between pages" do
	it "allows navigation from detailed page to the listing page" do
		
		share1 = Share.create(shares_data)

		
    visit share_url(share1)
		click_link "All Shares"
    expect(current_path).to eq(shares_path)

  end
it "allows navigation from listing page to the detailed page " do
    
   
    share1 = Share.create(shares_data)

    visit shares_url
    click_link share1.name
    expect(current_path).to eq(share_path(share1))

  end

end