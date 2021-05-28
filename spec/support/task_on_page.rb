class TaskOnPage
  include Capybara::DSL

  def create
    visit("/tasks/new")
    fill_in("Description", with: "Read a book")
    click_on("Create Task")
  end

  def edit_to_valid_task
    click_on("Read a book")
    click_on("Edit")
    fill_in("Description", with: "Read")
    click_on("Update Task")
  end

  def edit_to_blank_task_description
    click_on("Read a book")
    click_on("Edit")
    fill_in("Description", with: "")
    click_on("Update Task")
  end
end
