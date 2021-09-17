require "rails_helper"

describe TasksController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:log_in) { session[:user_id] = user.id }
  let(:task) { FactoryBot.create(:task) }
  let(:valid_attributes) { FactoryBot.attributes_for(:task) }
  let(:invalid_attributes) { FactoryBot.attributes_for(:task, description: "") }

  describe "GET index" do
    context "when logged in" do

      it "renders :index template" do
        get :index
        expect(response).to render_template(:index)
      end

      it "renders all tasks to the template" do
        get :index
        expect(assigns(:tasks)).to eq([task])
      end
    end
  end

  describe "GET new" do
    context "when logged in" do
      before { log_in }

      it "renders :new template" do
        get :new
        expect(response).to render_template(:new)
      end

      it "assigns new Task to @task" do
        get :new
        expect(assigns(:task)).to be_a_new(Task)
      end
    end

    context "when logged out" do
      it "redirects to the log in page" do
        get :new
        expect(subject).to redirect_to(new_session_path)
      end
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
      it "redirects to task#show" do
        log_in
        post :create, params: { task: valid_attributes }

        expect(response).to redirect_to(tasks_path)
      end

      it "creates a new Task in the database" do
        log_in
        expect {
          post :create, params: { task: valid_attributes }
        }.to change(Task, :count).by(1)
      end
    end

    context "with invalid data" do
      it "renders :new template" do
        log_in
        post :create, params: { task: invalid_attributes }
        expect(response).to render_template(:new)
      end

      it "does not create a new task in the database" do
        log_in
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

  describe "PATCH update" do
    let(:valid_update_attributes) { FactoryBot.attributes_for(:task, description: "Eat") }

    context "with valid data" do
      it "redirects to tasks#show" do
        patch :update, params: { id: task.id, task: valid_attributes }
        expect(response).to redirect_to(task_path)
      end

      it "updates task in the database" do
        patch :update, params: { id: task.id, task: valid_update_attributes }
        task.reload
        expect(task.description).to eq("Eat")
      end
    end

    context "with invalid data" do
      it "renders :edit template" do
        patch :update, params: { id: task.id, task: invalid_attributes }
        expect(response).to render_template(:edit)
      end

      it "does not update task in the database" do
        patch :update, params: { id: task.id, task: invalid_attributes }
        task.reload
        expect(task.description).to eq("Read a book")
      end
    end
  end

  describe "DELETE destroy" do
    before { task.save! }

    it "redirects to tasks#index" do
      delete :destroy, params: { id: task.id }
      expect(response).to redirect_to(root_path)
    end

    it "deletes task from the database" do
      expect {
         delete :destroy, params: { id: task.id }
       }.to change(Task, :count).by(-1)
    end
  end
end
