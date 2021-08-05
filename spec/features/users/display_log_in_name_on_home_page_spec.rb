require "rails_helper"
require "./spec/support/test_user.rb"

feature "Display logged in user" do
  let(:test_user) { TestUser.new }

  scenario "Current user's name displayed on home page" do
    test_user.create
    test_user.log_in

    expect(page).to have_content("Logged in as me@example.com")
  end
end
