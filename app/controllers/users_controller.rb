class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = user_params
    user[:email] = user[:email].downcase
    new_user = User.create(user_params)
    if new_user.save
      session[:user_id] = new_user.id
      redirect_to dashboard_path
    elsif params[:password] != params[:password_confirmation]
      redirect_to register_path
      flash[:alert] = "Password and password confirmation must match"
    else
      redirect_to register_path
      flash[:alert] = "All fields must be complete and valid"
    end
  end

  def show
    @user = User.find(session[:user_id])
    @parties = @user.parties
    @movies = @user.parties.map do |party|
      MoviesFacade.movie_by_id(party.movie_id)
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end

  def party_params
    params.permit(:id, :name, :date, :time, :movie_id, :movie_duration)
  end
end
