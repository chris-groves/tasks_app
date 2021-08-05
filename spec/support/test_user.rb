class TestUser
  include Capybara::DSL

  def create
    visit("/users/new")
    fill_in("Name", with: "Example")
    fill_in("Email", with: "me@example.com")
    fill_in("Password", with: "foobar")
    fill_in("Password confirmation", with: "foobar")
    click_on("Sign Up")
  end

  def create_without_name
    visit("/users/new")
    fill_in("Name", with: "")
    fill_in("Email", with: "me@example.com")
    fill_in("Password", with: "foobar")
    fill_in("Password confirmation", with: "foobar")
    click_on("Sign Up")
  end

  def create_without_email
    visit("/users/new")
    fill_in("Name", with: "Example")
    fill_in("Email", with: "")
    fill_in("Password", with: "foobar")
    fill_in("Password confirmation", with: "foobar")
    click_on("Sign Up")
  end

  def create_without_password
    visit("/users/new")
    fill_in("Name", with: "Example")
    fill_in("Email", with: "")
    fill_in("Password", with: "")
    fill_in("Password confirmation", with: "")
    click_on("Sign Up")
  end

  def create_with_short_password
    visit("/users/new")
    fill_in("Name", with: "Example")
    fill_in("Email", with: "")
    fill_in("Password", with: "foo")
    fill_in("Password confirmation", with: "foo")
    click_on("Sign Up")
  end

  def log_in
    visit("/sessions/new")
    fill_in("Email", with: "me@example.com")
    fill_in("Password", with: "foobar")
    click_on("Log in")
  end
end
