require "rails_helper"

RSpec.describe "Tasks", type: :request do
  describe "GET /tasks" do
    it "returns http success" do
      get "/tasks"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/tasks/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /tasks" do
    subject(:create_new_task) { post tasks_path, params: { task: { description: "Read" } } }

    it "creates a new task" do
      create_new_task
      expect(create_new_task).to redirect_to(tasks_path)
    end
  end
end
