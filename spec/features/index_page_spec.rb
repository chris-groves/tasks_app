require 'rails_helper'

feature 'main page' do
  scenario 'heading' do
    visit('/actions')
    expect(page).to have_content('Action Items')
  end
end
