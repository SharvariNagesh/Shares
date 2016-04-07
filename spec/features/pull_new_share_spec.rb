require "spec_helper"
require "rails_helper"



describe "Pulling a new share" do


	it "Pulls a new share from moneycontrol website url entered" do
		
    	visit shares_url
    	click_link "Pull Shares"
    	expect(current_path).to eq(new_share_path)

    	fill_in('Url', :with=>'http://www.moneycontrol.com/india/stockpricequote/food-processing/nestleindia/NI')

    	click_button('Pull the data')

        puts "sleeping..."
        sleep(30.seconds)
        puts "waking..."
    	expect(current_path).to eq(shares_path)
    	expect(page).to have_text("Nestle")
        expect(page).to have_text("Sector:")
        expect(page).to have_text("FOOD PROCESSING")

    end
end