module Api
  class TasksController < ApplicationController
    def index
      render(json: { "text" => "hello world" })
    end
  end
end
