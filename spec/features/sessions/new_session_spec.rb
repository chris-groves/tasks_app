require "rails_helper"
require "./spec/support/test_user.rb"

feature "New Session" do
  let(:test_user) { TestUser.new }

  context "Create new session" do
    scenario "Render log in form" do
      visit("/sessions/new")

      expect(page).to have_content("Log in to your account")
    end

    scenario "Log in to new session" do
      test_user.create
      test_user.log_in

      expect(page).to have_content("You have logged in!")
    end
  end

  context "Fail to create new session" do
    scenario "due to invalid email" do
      test_user.create
      visit("/sessions/new")
      fill_in("Email", with: "")
      fill_in("Password", with: "foobar")

      click_on("Log in")

      expect(page).to have_content("Email or password is invalid")
    end

    scenario "due to invalid password" do
      test_user.create
      visit("/sessions/new")
      fill_in("Email", with: "me@example.com")
      fill_in("Password", with: "foo")

      click_on("Log in")

      expect(page).to have_content("Email or password is invalid")
    end

    scenario "due to invalid email and password" do
      test_user.create
      visit("/sessions/new")
      fill_in("Email", with: "me@you.com")
      fill_in("Password", with: "foo")

      click_on("Log in")

      expect(page).to have_content("Email or password is invalid")
    end
  end
end
