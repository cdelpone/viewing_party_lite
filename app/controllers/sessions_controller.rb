class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate([params[:password])
      session[:user_id] = user.id
      redirect_to user_show_path(user)
    else
      redirect_to login_path
      flash[:alert] = "bad credentials, try again."
    end
  end

  def destroy
    session.destroy
    redirect_to root_path
  end
end
