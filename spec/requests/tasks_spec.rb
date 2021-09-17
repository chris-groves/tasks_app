require "rails_helper"

RSpec.describe "Tasks", type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:log_in) { post sessions_path, params: { session: { email: user.email, password: "foobar" } } }

  describe "GET /tasks" do
    it "returns http success" do
      get "/tasks"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      log_in
      get "/tasks/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /tasks" do
    subject(:create_new_task) { post tasks_path, params: { task: { description: "Read" } } }

    it "creates a new task" do
      log_in
      expect(create_new_task).to redirect_to(tasks_path)
    end
  end
end
