require "rails_helper"

describe TasksController, type: :controller do
  describe "GET new" do
    it "renders :new template" do
      get :new
      expect(response).to render_template(:new)
    end

    it "assigns new Task to @task" do
      get :new
      expect(assigns(:task)).to be_a_new(Task)
    end
  end

  describe "GET show" do
    let(:task) { Task.create(description: "Eat") }

    it "renders :show template" do
      get :show, params: { id: task.id }
      expect(response).to render_template(:show)
    end

    it "assigns requested task to @task" do
      get :show, params: { id: task.id }
      expect(assigns(:task)).to eq(task)
    end
  end
end
