require "spec_helper"
require "rails_helper"

describe "Vieweing the sector of shares" do
	it "lists all the shares in the sector" do
		
		visit shares_url
	    click_link "Extract Share Data"
	    expect(current_path).to eq(new_share_path)

	    fill_in('Url', :with=>'http://www.moneycontrol.com/india/stockpricequote/food-processing/nestleindia/NI')
       	click_button('Extract the data')

		expect(page).to have_text("Nestle")
		click_link "FOOD PROCESSING"
		expect(page).to have_text("Share In The FOOD PROCESSING Sector:")
		expect(page).to have_text("Nestle")
	    
	end
end