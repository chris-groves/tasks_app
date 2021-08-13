require "rails_helper"

describe Api::TasksController, type: :controller do

  before { FactoryBot.create(:task) }

  it "returns status code 200" do
    get :index
    expect(response).to have_http_status(:success)
  end
end
