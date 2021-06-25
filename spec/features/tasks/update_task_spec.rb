require "rails_helper"
require "./spec/support/task_on_page.rb"

feature "update task" do
  let(:task_on_page) { TaskOnPage.new }

  scenario "update a task" do
    task_on_page.create
    task_on_page.edit_to_valid_task

    expect(page).to have_content("Read")
  end

  scenario "fail to update a task" do
    task_on_page.create
    task_on_page.edit_to_blank_task_description

    expect(page).to have_content("Description can't be blank")
  end
end
