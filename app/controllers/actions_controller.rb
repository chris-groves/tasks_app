class ActionsController < ApplicationController
  def index
    @actions = Action.all
  end

  def new
    @action = Action.new
  end

  def create
    @action = Action.new(action_params)

    if @action.save
      redirect_to :root
    else
      render :new
    end
  end

  private
    def action_params
      # binding.pry
      params.permit(:description)
    end
end
