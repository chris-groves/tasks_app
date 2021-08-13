require "rails_helper"

describe Api::TasksController, type: :controller do

  before { FactoryBot.create(:task) }

  it "returns status code 200" do
    get :index
    expect(response).to have_http_status(:success)
  end

  it "returns the task description" do
    get :index
    expect(JSON.parse(response.body)[0]["description"]).to eq("Read a book")
  end

  it "returns all tasks" do
    get :index
    expect(JSON.parse(response.body).size).to eq(1)
  end
end
