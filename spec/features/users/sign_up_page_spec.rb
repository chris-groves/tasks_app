require "rails_helper"

feature "New User" do
  scenario "create a new user" do
    visit("/users/new")

    expect(page).to have_content("Sign Up")
  end
end
