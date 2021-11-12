RSpec.describe DataWrapper::Task, type: :model do
  let(:task) { described_class.new(data) }
  let(:data) do
    { "id": "3a4320e2-cf11-41d0-ab79-f65dfac526ec",
      "description": "Read a book" }
  end

  it "contains an id" do
    expect(task.id).to eql("3a4320e2-cf11-41d0-ab79-f65dfac526ec")
  end

  it "contains a description" do
    expect(task.description).to eql("Read a book")
  end
end
