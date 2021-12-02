class Movie
  attr_reader :image_url, :title, :runtime, :id, :vote_average, :genre, :overview

  def initialize(data)
    @image_url = data[:image_url]
    @title = data[:title]
    @runtime = data[:runtime]
    @id = data[:id]
    @vote_average = data[:vote_average]
    @genre = data[:genre]
    @overview = data[:overview]
  end
end
