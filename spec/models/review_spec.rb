require "spec_helper"
require "rails_helper"

describe "A review" do

  it "belongs to a share" do
    share = Share.create(shares_data)

    review = share.reviews.new(review_attributes)

    expect(review.share).to eq(share)
  end

  it "with example attributes is valid" do
    review = Review.new(review_attributes)

    expect(review.valid?).to eq(true)
  end

  it "requires a comment" do
    review = Review.new(comment: "")

    review.valid?

    expect(review.errors[:comment].any?).to eq(true)
  end

  it "requires a comment over 3 characters" do
    review = Review.new(comment: "X" * 3)

    review.valid?

    expect(review.errors[:comment].any?).to eq(true)
  end

  it "accepts priority values of 1 through 3" do
    priority = [1, 2, 3]
    priority.each do |prio|
      review = Review.new(priority: prio)

      review.valid?

      expect(review.errors[:priority].any?).to eq(false)
    end
  end

  it "rejects invalid priority values" do
    priority = [-1, 0, 6]
    priority.each do |prior|
      review = Review.new(priority: priority)

      review.valid?

      expect(review.errors[:priority].any?).to eq(true)
      expect(review.errors[:priority].first).to eq("must be between 1 and 3")
    end
  end
end
