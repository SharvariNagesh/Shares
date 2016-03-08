require "spec_helper"

describe "Vieweing the list of shares" do
	it "lists all the share details entered" do
		visit "http://localhost:3000/shares"

		expect(page).to have_text("2 Shares")
		expect(page).to have_text("Share1")
		expect(page).to have_text("Share2")
	end
end