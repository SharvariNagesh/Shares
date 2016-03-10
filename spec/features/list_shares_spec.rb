require "spec_helper"
require "rails_helper"

describe "Vieweing the list of shares" do
	it "lists all the share details entered" do
		


		share1 = Share.create(shares_data)
		share2 = Share.create(shares_data(name: "Colgate Palmolive"))

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