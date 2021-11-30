class MoviesController < ApplicationController
  def index
    @user = User.find(params[:id])

    @movies = if params[:original_title]
      MoviesFacade.movies_by_title(params[:original_title])
    else
      MoviesFacade.top_40
    end
  end
end
