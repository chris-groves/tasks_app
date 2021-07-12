require "rails_helper"
require "./spec/support/test_user.rb"

feature "New Session" do
  let(:test_user) { TestUser.new }

  scenario "Log in form" do
    visit("/sessions/new")

    expect(page).to have_content("Log in to your account")
  end

  scenario "Log in to new session" do
    test_user.create
    test_user.log_in

    expect(page).to have_content("You have logged in!")
  end
end
