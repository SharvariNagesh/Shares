describe "Navigation between pages" do
	it "allows navigation from detailed page to the listing page" do
		
		share1 = Share.create(name: "Nestle",
                      current_price: 5304,
                      year_low: 4990,
                      year_high: 7499,
                      current_PE_ratio: 90.80,
                      market_cap: 51143.23,
                      book_value: 352.69,
                      description: "Nestle is in the Food Processing sector. The current market capitalisation stands at Rs 51,143.23 crore.",
                      price_to_book_value: 15.40)

		share2 = Share.create(name: "Colgate Palmolive",
                      current_price: 826,
                      year_low: 810,
                      year_high: 1099,
                      current_PE_ratio: 37.82,
                      market_cap: 22474,
                      book_value: 28.32,
                      description: "Colgate is in the Personal Care sector. The current market capitalisation stands at Rs 22,474.17 crore.",
                      price_to_book_value: 29.18)

    visit share_url(share1)
		click_link "All Shares"
    expect(current_path).to eq(shares_path)

  end
it "allows navigation from listing page to the detailed page " do
    
    share1 = Share.create(name: "Nestle",
                      current_price: 5304,
                      year_low: 4990,
                      year_high: 7499,
                      current_PE_ratio: 90.80,
                      market_cap: 51143.23,
                      book_value: 352.69,
                      description: "Nestle is in the Food Processing sector. The current market capitalisation stands at Rs 51,143.23 crore.",
                      price_to_book_value: 15.40)

    share2 = Share.create(name: "Colgate Palmolive",
                      current_price: 826,
                      year_low: 810,
                      year_high: 1099,
                      current_PE_ratio: 37.82,
                      market_cap: 22474,
                      book_value: 28.32,
                      description: "Colgate is in the Personal Care sector. The current market capitalisation stands at Rs 22,474.17 crore.",
                      price_to_book_value: 29.18)

    visit shares_url
    click_link share1.name
    expect(current_path).to eq(share_path(share1))

  end

end