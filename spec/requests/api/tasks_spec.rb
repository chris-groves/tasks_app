require "rails_helper"
require "swagger_helper"

RSpec.describe "Tasks", type: :request do
  describe "Tasks API" do
    path "/api/tasks" do
      get "retrieves all tasks" do
        tags "tasks"
        produces 'application/json'

        response "200", "Success" do
          schema type: :array,
          properties: {
            id: {type: :integer },
            description: { type: :string }
          },
          required: [ "description" ]

          examples 'application/json' => {
            id: 1,
            description: "Read a book"
          }

          let(:task) { Task.create(description: "Eat") }
          run_test!
        end
      end
    end
  end
end
