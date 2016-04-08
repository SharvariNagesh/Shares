require "spec_helper"
require "rails_helper"

describe "Deleting a share" do
	it "deletes the share and lists the shares without the deleted share" do

		share1 = Share.create(shares_data)
		share2 = Share.create(shares_data(name: "Colgate Palmolive", description:"Colgate is in health sector"))

        visit share_url(share1)
        click_link 'Delete'

        expect(current_path).to eq(shares_path)
        expect(page).not_to have_text(share1.name)
    end

    it "share can have many reviews" do
  		share = share.new(share_data)

  		review1 = share.reviews.new(review_attributes)
  		review2 = share.reviews.new(review_attributes(comment:"Testing.."))

  		expect(share.reviews).to include(review1)
  		expect(share.reviews).to include(review2)
	end

	it "deleting a share deletes associated reviews" do
  		share = share.create(share_data)

  		share.reviews.create(review_attributes)

  		expect {
    		share.destroy
  		}.to change(Review, :count).by(-1)
	end

end
	
