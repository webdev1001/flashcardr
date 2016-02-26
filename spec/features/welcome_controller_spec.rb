require "rails_helper"

describe "check translation process in welcome page", type: :feature do
  before :each do
    create(:card)
  end

  it "for right translation with positive flash message" do
    visit root_path
    find(:xpath, "//input[@type = 'text'][@id = 'user_trans2']").set("Pimp my ride")
    click_button "Проверить перевод"
    expect(page).to have_content "Правильный перевод! Переведите следующую карточку"
  end
end
