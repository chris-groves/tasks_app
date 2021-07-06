require "rails_helper"

feature "New Session" do
  scenario "Log in as a user" do
    visit("/sessions/new")

    expect(page).to have_content("Log in to your account")
  end
end
