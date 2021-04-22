require 'rails_helper'

feature 'main page' do
  scenario 'heading' do
    visit('/actions')

    expect(page).to have_content('Action Items')
  end

  scenario 'heading' do
    action = Action.create(description: "Read a book")
    visit('/actions')

    expect(page).to have_content('Read a book')
  end
end
