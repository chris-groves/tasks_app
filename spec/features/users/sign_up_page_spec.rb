require "rails_helper"

feature "New User" do
  scenario "create a new user" do
    visit("/users/new")
    fill_in("Name", with: "Example")
    fill_in("Email", with: "me@example.com")
    fill_in("Password", with: "foobar")
    fill_in("Password confirmation", with: "foobar")

    click_on("Sign Up")

    expect(page).to have_content("You have successfully signed up!")
  end
end
