require "rails_helper"

feature "Log in to create tasks" do
  let(:test_user) { TestUser.new }

  scenario "Logged in user can create a new task" do
    test_user.create
    test_user.log_in

    expect(page).to have_content("Add New Task")
  end

  scenario "Cannot create a new task when logged out" do
    visit("/")

    expect(page).not_to have_content("Add New Task")
  end
end
