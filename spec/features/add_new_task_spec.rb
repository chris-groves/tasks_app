require 'rails_helper'

feature 'new task' do
  scenario 'add a new task item' do
    visit('/tasks/new')
    fill_in('Description', with: 'Read a book')
    click_on('Create Task')

    expect(page).to have_content('Read a book')
  end
end
