class MoviesController < ApplicationController
  def index
    @user = User.find(params[:id])

    @movies = if params[:original_title]
      MoviesFacade.movies_by_title(params[:original_title])
    else
      MoviesFacade.top_40
    end
  end

  def show
    @movie = MoviesFacade.movie_by_id(params[:id])
    @movie_cast = MoviesFacade.movie_cast(params[:id])
    @movie_reviews = MoviesFacade.movie_reviews(params[:id])

    @hours = @movie[:runtime]/60
    @minutes = (@movie[:runtime].to_f%60).to_i
  end
end
