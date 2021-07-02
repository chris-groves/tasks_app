require "rails_helper"

describe UsersController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:valid_attributes) { FactoryBot.attributes_for(:user) }

  describe "GET new" do
    it "renders :new template" do
      get :new
      expect(response).to render_template(:new)
    end

    it "assigns new User to @task" do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe "POST create" do
    context "with valid data" do
      it "redirects to task#show" do
        post :create, params: { user: valid_attributes }
        expect(response).to redirect_to(root_path)
      end

      it "creates a new Task in the database" do
        expect {
          post :create, params: { user: valid_attributes }
        }.to change(User, :count).by(1)
      end
    end
  end
end
