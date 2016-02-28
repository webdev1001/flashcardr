require "rails_helper"

feature "Translation Check" do
  scenario "is correct on welcome page" do
    given_there_is_a_card
    when_i_check_correct_translation_on_welcome_page
    then_success_message_should_appear
  end

  scenario "is wrong on welcome page" do
    given_there_is_a_card
    when_i_check_wrong_translation_on_welcome_page
    then_false_message_should_appear
  end

  def given_there_is_a_card
    @card = create(:card)
    @card.review_date = Time.now.utc - 1.day # to pass check to display card
    @card.save!
  end

  def when_i_check_correct_translation_on_welcome_page
    visit root_path
    fill_in "welcome_user_translation_text", with: @card.original_text
    click_button "Проверить перевод"
  end

  def when_i_check_wrong_translation_on_welcome_page
    visit root_path
    fill_in "welcome_user_translation_text", with: @card.translated_text
    click_button "Проверить перевод"
  end

  def then_success_message_should_appear
    expect(page).to have_content :correct_translation_message
  end

  def then_false_message_should_appear
    expect(page).to have_content :wrong_translation_message
  end
end
