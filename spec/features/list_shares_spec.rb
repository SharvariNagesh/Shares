require "spec_helper"
require "rails_helper"

describe "Vieweing the list of shares" do
	it "lists all the share details entered" do
		


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
		expect(page).to have_text("2 Shares")
		expect(page).to have_text(share1.name)
		expect(page).to have_text(share2.name)
    expect(page).to have_text(share1.book_value)
    expect(page).to have_text(share1.current_price)
    expect(page).to have_text(share1.current_PE_ratio)
    expect(page).to have_text(share1.market_cap)
    expect(page).to have_text(share1.price_to_book_value)
    expect(page).to have_text(share1.description)

	end
end