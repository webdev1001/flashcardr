require 'rails_helper'

RSpec.describe Card, :type => :model do

  context "#check_translation" do
    let(:card) { Card.create!(original_text: "Pimp my ride", translated_text: "Прокачай мою тачку") }
    
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

  it "do not save/create card with identical original and translated text fields" do
    card = Card.new(original_text: "Big", translated_text: "Big")
    
    expect(card.valid?).to be false
  end

  it "check update review_date when creating card" do
    card = Card.create(original_text: "Big", translated_text: "Большой")
    original_review_date = card.review_date
    original_review_date = 3.days.from_now
   
    # Update precision of Time with .to_s (drop milisecond compare)
    expect(card.review_date.to_s).to eql(original_review_date.to_s)
  end

end
