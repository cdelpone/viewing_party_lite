class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to "/users/#{user.id}"
    else
      redirect_to register_path
      flash[:alert] = "Please enter valid data"
    end
  end

  def show
    @user = User.find(params[:user_id])
    @parties = @user.parties
    @movies = @user.parties.map do |party|
      MoviesFacade.movie_by_id(party.movie_id)
    end
  end

  private

  def user_params
    params.permit(:name, :email)
  end

  def party_params
    params.permit(:id, :name, :date, :time, :movie_id, :movie_duration)
  end

end
