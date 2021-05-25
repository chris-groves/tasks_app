require 'rails_helper'

feature 'show page' do
  scenario 'view an individual task' do
    visit('/tasks/new')
    fill_in('Description', with: 'Read a book')
    click_on('Create Task')
    click_on('Read a book')

    expect(page).to have_content('Read a book')
  end

  scenario 'delete a task' do
    visit('/tasks/new')
    fill_in('Description', with: 'Read a book')
    click_on('Create Task')
    click_on('Read a book')
    click_on('Delete')

    expect(page).to_not have_content('Read a book')
  end
end
