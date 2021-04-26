require 'rails_helper'

feature 'main page' do
  scenario 'heading' do
    visit('/tasks')

    expect(page).to have_content('Tasks')
  end

  scenario 'link to create a new task' do
    visit('/tasks')
    click_on('Add New Task')

    expect(page).to have_text('Add a New Task')
  end
end
