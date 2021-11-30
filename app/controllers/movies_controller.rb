class MoviesController < ApplicationController
  def index
    @user = User.find(params[:id])
    @top_40_movies = MoviesFacade.top_40
  end
end
