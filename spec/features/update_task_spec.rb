require "rails_helper"

feature "update task" do
  scenario "update a task" do
    visit("/tasks/new")
    fill_in("Description", with: "Read a book")
    click_on("Create Task")
    click_on("Read a book")
    click_on("Edit")
    fill_in("Description", with: "Read")
    click_on("Update Task")

    expect(page).to have_content("Read")
  end
end
