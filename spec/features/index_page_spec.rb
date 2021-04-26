require 'rails_helper'

feature 'main page' do
  scenario 'heading' do
    visit('/tasks')

    expect(page).to have_content('Tasks')
  end

  scenario 'link to create new tasks page has been disabled' do
    FeatureFlag.create(name: "new_tasks_link", enabled: false)

    visit('/tasks')

    expect(page).to_not have_link('Add New Task')
  end
end
