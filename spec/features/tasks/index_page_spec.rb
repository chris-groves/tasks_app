require "rails_helper"

feature "main page" do
  scenario "heading" do
    visit("/tasks")

    expect(page).to have_content("Tasks")
  end
end
