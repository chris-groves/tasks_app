require "rails_helper"

feature "New User" do
  context "Create user" do
    scenario "Create a new user" do
      visit("/users/new")
      fill_in("Name", with: "Example")
      fill_in("Email", with: "me@example.com")
      fill_in("Password", with: "foobar")
      fill_in("Password confirmation", with: "foobar")

      click_on("Sign Up")

      expect(page).to have_content("You have successfully signed up!")
    end
  end

  context "Fail to create user" do
    scenario "due to invalid name" do
      visit("/users/new")
      fill_in("Name", with: "")
      fill_in("Email", with: "me@example.com")
      fill_in("Password", with: "foobar")
      fill_in("Password confirmation", with: "foobar")

      click_on("Sign Up")

      expect(page).to have_content("Name can't be blank")
    end

    scenario "due to invalid email" do
      visit("/users/new")
      fill_in("Name", with: "Me")
      fill_in("Email", with: "")
      fill_in("Password", with: "foobar")
      fill_in("Password confirmation", with: "foobar")

      click_on("Sign Up")

      expect(page).to have_content("Email can't be blank")
    end

    scenario "due to blank password" do
      visit("/users/new")
      fill_in("Name", with: "Me")
      fill_in("Email", with: "me@example.com")
      fill_in("Password", with: "")
      fill_in("Password confirmation", with: "")

      click_on("Sign Up")

      expect(page).to have_content("Password can't be blank")
    end

    scenario "due to password being too short" do
      visit("/users/new")
      fill_in("Name", with: "Me")
      fill_in("Email", with: "me@example.com")
      fill_in("Password", with: "foo")
      fill_in("Password confirmation", with: "foo")

      click_on("Sign Up")

      expect(page).to have_content("Password is too short")
    end
  end
end
