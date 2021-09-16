require "rails_helper"
require "./spec/support/task_on_page.rb"

feature "new task" do
  scenario "add a new task item" do
    task_on_page = TaskOnPage.new
    task_on_page.create

    expect(page).to have_content("Read a book")
  end

  scenario "fail to add a new task item" do
    visit("/users/new")
    fill_in("Name", with: "Example")
    fill_in("Email", with: "me@example.com")
    fill_in("Password", with: "foobar")
    fill_in("Password confirmation", with: "foobar")
    click_on("Sign Up")
    visit("/sessions/new")
    fill_in("Email", with: "me@example.com")
    fill_in("Password", with: "foobar")
    click_on("Log in")
    visit("/tasks/new")
    click_on("Create Task")

    expect(page).to have_content("Description can't be blank")
  end

  scenario "link to index page" do
    visit("/users/new")
    fill_in("Name", with: "Example")
    fill_in("Email", with: "me@example.com")
    fill_in("Password", with: "foobar")
    fill_in("Password confirmation", with: "foobar")
    click_on("Sign Up")
    visit("/sessions/new")
    fill_in("Email", with: "me@example.com")
    fill_in("Password", with: "foobar")
    click_on("Log in")
    visit("/tasks/new")
    click_on("Create Task")
    visit("/tasks/new")
    click_on("Index Page")

    expect(page).to have_content("Tasks")
  end
end
