class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "You have logged in!"
    else
      flash[:notice] = "Email or password is invalid"
      render :new
    end
  end
end
