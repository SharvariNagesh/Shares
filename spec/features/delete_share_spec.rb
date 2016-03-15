require "spec_helper"
require "rails_helper"

describe "Deleting a share" do
	it "deletes the share and lists the shares without the deleted share" do

		share1 = Share.create(shares_data)
		share2 = Share.create(shares_data(name: "Colgate Palmolive"))

        visit share_url(share1)
        click_link 'Delete'

        expect(current_path).to eq(shares_path)
        expect(page).not_to have(share1.name)
    end

end
	
