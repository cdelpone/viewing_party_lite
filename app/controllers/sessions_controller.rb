class SessionsController < ApplicationController
  def new
  end

  def creates
    user = User.find_by(email: params[:email])
    if user && user.authenticate([params[:password])
      redirect_to user_show_path(user)
    else
      redirect_to login_path
      flash[:alert] = "bad credentials, try again."
    end
  end
end
