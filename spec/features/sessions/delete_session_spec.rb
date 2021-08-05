require "rails_helper"

feature "New Session" do
  let(:test_user) { TestUser.new }

  context "Close a session" do
    scenario "Request user log out confirmation" do
      test_user.create
      test_user.log_in
      click_on("Log Out")

      expect(page).to have_content("Are you sure you want to log out?")
    end

    scenario "Log out user confirmation" do
      test_user.create
      test_user.log_in
      click_on("Log Out")
      click_on("Yes")

      expect(page).to have_content("You have logged out")
    end
  end
end
