require "rails_helper"

feature "Navigate to Sign Up Page" do
  scenario "link on index page" do
    visit("/tasks")

    expect(page).to have_content("Sign Up")
  end

  scenario "link to create new user page" do
    visit("/tasks")
    click_on("Sign Up")

    expect(page).to have_content("Create an Account")
  end
end
