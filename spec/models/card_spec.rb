require 'rails_helper'

RSpec.describe Card, type: :model do
  context "#check_translation" do

    # (.create) will persist to the db and will call ActiveRecord validations
    let(:card) { FactoryGirl.create(:card) }

    it "check exact correct translation" do
      expect(card.check_translation("Pimp my ride")).to be true
    end

    it "check translation with upcase/downcase difference" do
      expect(card.check_translation("pIMp MY RiDE")).to be true
    end

    it "check for wrong translation" do
      expect(card.check_translation("Pimp mA ride")).to be false
    end

    it "check for spaces in translation" do
      expect(card.check_translation(" pimp my ride ")).to be true
    end
  end

  it "do not save/create card with identical
      original and translated text fields" do

    # run validations (.valid?) without saving to DB (.build)
    expect(FactoryGirl.build(:card, translated_text: "Pimp my ride").valid?).to be false
  end

  it "check update review_date when creating card" do
    card = FactoryGirl.create(:card)
    original_review_date = card.review_date
    original_review_date = 3.days.from_now

    # Update precision of Time with .to_s (drop milisecond compare)
    expect(card.review_date.to_s).to eql(original_review_date.to_s)
  end

  it "has a valid factory" do
    expect(FactoryGirl.create(:card)).to be_valid
  end

end