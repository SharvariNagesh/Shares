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
end