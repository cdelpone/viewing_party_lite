class PartyController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @users = User.all_except(@user)
    @movie = MoviesFacade.movie_by_id(params[:id])
  end

  def create
    @user = User.find(params[:user_id])
    @movie = MoviesFacade.movie_by_id(params[:id])

    @movie[:original_title] = params[:name]
    @party = Party.create!(party_params)
    # @party_invitee = PartyInvitee.create!(user: @user, party: @party)
    redirect_to user_show_path(@user)
  end

  private

  def party_params
    params.permit(:id, :name, :date, :time, :movie_id, :movie_duration)
  end

  def movie_params
    params.permit(:id, :original_title)
  end


end
