class Movie
  attr_reader :poster_path, :title, :runtime, :id, :vote_average, :genres, :overview

  def initialize(data)
    @image_url = data[:poster_path]
    @title = data[:title]
    @runtime = data[:runtime]
    @id = data[:id]
    @vote_average = data[:vote_average]
    @genres = data[:genres]
    @overview = data[:overview]
  end

  def movie_genres
    genres.map do |genre|
      genre[:name]
    end
  end
end
