require "rails_helper"

describe SessionsController, type: :controller do

  describe "POST create" do
    context "with valid data" do
      it "redirects to homepage" do
        User.create(name: "Chris", email: "me@example.com", password: "foobar",
                    password_confirmation: "foobar")
        post :create, params: { session: { email: "me@example.com",
                                          password: "foobar" } }
        expect(response).to redirect_to(root_path)
      end

      it "creates a new session" do
        user = User.create(name: "Chris", email: "me@example.com",
                           password: "foobar", password_confirmation: "foobar")
        post :create, params: { session: { email: "me@example.com",
                                          password: "foobar" } }
        expect(session[:user_id]).to eq(user.id)
      end
    end
  end

  describe "DELETE destroy" do
    it "redirects to homepage" do
      User.create(name: "Chris", email: "me@example.com", password: "foobar",
                  password_confirmation: "foobar")
      post :create, params: { session: { email: "me@example.com",
                                        password: "foobar" } }
      delete :destroy, params: { id: session[:user_id] }

      expect(response).to redirect_to(root_path)
    end

    it "detroys the session" do
      user = User.create(name: "Chris", email: "me@example.com",
                         password: "foobar", password_confirmation: "foobar")
      post :create, params: { session: { email: "me@example.com",
                                        password: "foobar" } }
      delete :destroy, params: { id: session[:user_id] }
      
      expect(session[:user_id]).to eq(nil)
    end
  end
end
