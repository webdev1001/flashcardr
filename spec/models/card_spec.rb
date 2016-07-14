require "rails_helper"

RSpec.describe Card, type: :model do
  context "#check_translation" do
    # (.create) will persist to the db and will call ActiveRecord validations
    let(:card) { create(:card) }

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
    expect(build(:card, translated_text: "Pimp my ride").valid?).to be false
  end

  it "check update review_date when creating card" do
    card = create(:card)
    # Update precision of Time with .to_s (drop milisecond compare)
    expect(card.review_date.to_s).to eql((Time.now.utc + 3.days).to_s)
  end
end
