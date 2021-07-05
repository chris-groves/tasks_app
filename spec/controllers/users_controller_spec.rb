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

    context "with invalid data" do
      context "with invalid name" do
        let(:invalid_name) { FactoryBot.attributes_for(:user, name: "") }

        it "renders :new template" do
          post :create, params: { user: invalid_name }
          expect(response).to render_template(:new)
        end

        it "does not create a new user in the database" do
          expect {
            post :create, params: { user: invalid_name }
          }.not_to change(User, :count)
        end
      end
      context "with invalid email" do
        let(:invalid_email) { FactoryBot.attributes_for(:user, email: "") }

        it "renders :new template" do
          post :create, params: { user: invalid_email }
          expect(response).to render_template(:new)
        end

        it "does not create a new user in the database" do
          expect {
            post :create, params: { user: invalid_email }
          }.not_to change(User, :count)
        end
      end
      context "with blank password" do
        let(:blank_password) { FactoryBot.attributes_for(:user, password: "") }

        it "renders :new template" do
          post :create, params: { user: blank_password }
          expect(response).to render_template(:new)
        end

        it "does not create a new user in the database" do
          expect {
            post :create, params: { user: blank_password }
          }.not_to change(User, :count)
        end
      end
      context "with short password" do
        let(:short_password) { FactoryBot.attributes_for(:user, password: "foo") }

        it "renders :new template" do
          post :create, params: { user: short_password }
          expect(response).to render_template(:new)
        end

        it "does not create a new user in the database" do
          expect {
            post :create, params: { user: short_password }
          }.not_to change(User, :count)
        end
      end
    end
  end
end
