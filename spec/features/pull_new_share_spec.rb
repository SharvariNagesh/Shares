require "spec_helper"
require "rails_helper"



describe "Pulling a new share" do


	it "Pulls a new share from moneycontrol website url entered" do
		
    	visit shares_url
    	click_link "Pull A New Share"
    	expect(current_path).to eq(new_share_path)

    	fill_in('Url', :with=>'http://www.moneycontrol.com/india/stockpricequote/food-processing/nestleindia/NI')

    	click_button('Pull the data')

        #sleep(5.seconds)
        expect(current_path).to eq(shares_path)
    	expect(page).to have_text("Nestle")
        expect(page).to have_text("Sector:")
        expect(page).to have_text("FOOD PROCESSING")

    end

    it "prints an error message when invalid url is entered" do

        visit new_share_path
        fill_in('Url', :with=>'ABCD')
        click_button('Pull the data')

        expect(page).to have_text('Error:Invalid URL')
    end


    it "prints an error message when Non Moneycontrol url is entered" do

        visit new_share_path
        fill_in('Url', :with=>'http://notMoneycontrol.com')
        click_button('Pull the data')

        expect(page).to have_text('Error:Invalid URL')
    end

    it "prints an alert message when moneycontrol url without a proper data is entered" do
        visit new_share_path
        fill_in('Url', :with=>'http://www.moneycontrol.com/india/stockpricequote/machine-tools/aamcoltools/AT01')
        click_button('Pull the data')

        expect(page).to have_text('Error: Not a traded share')
    end
end
