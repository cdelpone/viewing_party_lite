class PartyController < ApplicationController
  def new
    @user = User.find(session[:user_id])
    @movie = MoviesFacade.movie_by_id(params[:id])
  end

  def create
    user = User.find(session[:user_id])
    movie = MoviesFacade.movie_by_id(params[:id])
    party = Party.new(party_params)
    party.user_id = user.id
    if party.save
      PartyInvitee.create!(user_id: user.id, party_id: party.id)
      redirect_to dashboard_path
    else
      flash[:alert] = 'Invalid input. Please try again.'
      redirect_to new_viewing_party_path(movie.id)
    end
  end

  private

  def party_params
    params.permit(:id, :name, :date, :time, :movie_id, :movie_duration, :user_id, user_ids: [])
  end

  def movie_params
    params.permit(:movie_id, :title)
  end
end
