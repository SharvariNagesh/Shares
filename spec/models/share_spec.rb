require 'rails_helper'

RSpec.describe Share, type: :model do
  it "has many reviews" do
    share = Share.new(shares_data)

    review1 = share.reviews.new(review_attributes)
    review2 = share.reviews.new(review_attributes)

    expect(share.reviews).to include(review1)
    expect(share.reviews).to include(review2)
  end

  it "deletes associated reviews" do
    share = Share.create(shares_data)

    share.reviews.create(review_attributes)

    expect {
      share.destroy
    }.to change(Review, :count).by(-1)
  end

  it "requires a name" do
    share = Share.create(shares_data(name:""))

    share.valid? # populates errors

    expect(share.errors[:name].any?).to eq(true)
  end


  it "requires a sector" do
    share = Share.create(shares_data(sector:""))

    share.valid? # populates errors

    expect(share.errors[:sector].any?).to eq(true)
  end

  
  it "requires a current_price" do
    share = Share.create(shares_data(current_price:""))

    share.valid? # populates errors

    expect(share.errors[:current_price].any?).to eq(true)
  end
end
