require "rails_helper"

describe UsersController, type: :controller do
  describe "GET new" do
    it "renders :new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end
end
