require "rails_helper"

feature "show page" do
  let(:task_on_page) { TaskOnPage.new }
  
  scenario "view an individual task" do
    task_on_page.create

    click_on("Read a book")

    expect(page).to have_content("Read a book")
  end

  scenario "delete a task" do
    task_on_page.create

    click_on("Read a book")
    click_on("Delete")

    expect(page).not_to have_content("Read a book")
  end
end
