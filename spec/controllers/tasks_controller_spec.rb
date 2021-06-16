require "rails_helper"

describe TasksController, type: :controller do
  let(:task) { FactoryBot.create(:task) }

  describe "GET index" do
    it "renders :index template" do
      get :index
      expect(response).to render_template(:index)
    end

    it "renders all tasks to the template" do
      get :index
      expect(assigns(:tasks)).to eq([task])
    end
  end

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
    it "renders :show template" do
      get :show, params: { id: task.id }
      expect(response).to render_template(:show)
    end

    it "assigns requested task to @task" do
      get :show, params: { id: task.id }
      expect(assigns(:task)).to eq(task)
    end
  end

  describe "POST create" do
    context "with valid data" do
      let(:valid_attributes) { FactoryBot.attributes_for(:task) }

      it "redirects to task#show" do
        post :create, params: { task: valid_attributes }
        expect(response).to redirect_to(tasks_path)
      end

      it "creates a new Task in the database" do
        expect {
          post :create, params: { task: valid_attributes }
        }.to change(Task, :count).by(1)
      end
    end

    context "with invalid data" do
      let(:invalid_attributes) { FactoryBot.attributes_for(:task, description: "") }

      it "renders :new template" do
        post :create, params: { task: invalid_attributes }
        expect(response).to render_template(:new)
      end

      it "does not create a new task in the database" do
        expect {
          post :create, params: { task: invalid_attributes }
        }.not_to change(Task, :count)
      end
    end
  end

  describe "GET edit" do
    it "renders :edit template" do
      get :edit, params: { id: task.id }
      expect(response).to render_template(:edit)
    end

    it "assigns requested task to template" do
      get :edit, params: { id: task.id }
      expect(assigns(:task)).to eq(task)
    end
  end
end
