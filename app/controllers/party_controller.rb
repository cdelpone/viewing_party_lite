class PartyController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @users = User.all_except(@user)
    @movie = MoviesFacade.movie_by_id(params[:id])
  end

  def create
    user = User.find(params[:user_id])
    party = Party.create!(party_params)
    if party.save
      party_invitee = PartyInvitee.create!(user: user, party: party)
      redirect_to user_show_path(user)
    else
      flash[:alert] = 'Invalid input. Please try again.'
    end
  end

  private

  def party_params
    params.permit(:id, :name, :date, :time, :movie_id, :movie_duration)
  end

  def movie_params
    params.permit(:movie_id, :title)
  end
end
