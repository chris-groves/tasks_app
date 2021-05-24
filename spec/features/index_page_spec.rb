require 'rails_helper'

feature 'main page' do
  scenario 'heading' do
    visit('/tasks')

    expect(page).to have_content('Tasks')
  end

  scenario 'link to create new tasks page' do
    visit('/tasks')
    click_on('Add New Task')

    expect(page).to have_content('Add a New Task')
  end
end
