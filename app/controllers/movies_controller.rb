class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @movies = if params[:title]
      MoviesFacade.movies_by_title(params[:title])
    else
      MoviesFacade.top_40
    end
  end

  def show
    @user = User.find(params[:user_id])
    @movie = MoviesFacade.movie_by_id(params[:id])
    @movie_cast = MoviesFacade.movie_cast(params[:id])
    @movie_reviews = MoviesFacade.movie_reviews(params[:id])
  end
end
