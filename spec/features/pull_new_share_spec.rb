require "spec_helper"
require "rails_helper"

describe "Pulling a new share" do
	it "Pulls a new share from moneycontrol website url entered" do
		
    	visit shares_url
    	click_link "Pull Shares"
    	expect(current_path).to eq(pull_share_path)

    	fill_in('url', :with=>'http://www.moneycontrol.com/india/stockpricequote/food-processing/nestleindia/NI')

    	click_button('Pull Share')
    	expect(current_path).to eq(share_path)
    	expect(page).to have_text("Nestle")

    end
end