require "rails_helper"

feature "Navigate to Log In Page" do
  scenario "link on index page" do
    visit("/tasks")

    expect(page).to have_content("Log In")
  end

  scenario "link to create new user page" do
    visit("/tasks")
    click_on("Log In")

    expect(page).to have_content("Log in to your account")
  end
end
