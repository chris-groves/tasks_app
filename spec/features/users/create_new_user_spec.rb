require "rails_helper"
require "./spec/support/test_user.rb"

feature "New User" do
  let(:test_user) { TestUser.new }

  context "Create user" do
    scenario "Create a new user" do
      test_user.create

      expect(page).to have_content("You have successfully signed up!")
    end
  end

  context "Fail to create user" do
    scenario "due to invalid name" do
      test_user.create_without_name

      expect(page).to have_content("Name can't be blank")
    end

    scenario "due to invalid email" do
      test_user.create_without_email

      expect(page).to have_content("Email can't be blank")
    end

    scenario "due to blank password" do
      test_user.create_without_password

      expect(page).to have_content("Password can't be blank")
    end

    scenario "due to password being too short" do
      test_user.create_with_short_password

      expect(page).to have_content("Password is too short")
    end
  end
end
