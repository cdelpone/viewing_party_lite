# frozen_string_literal: true

class MoviesFacade
  class << self
    def top_40
      page1 = MoviesService.get_data('movie/top_rated?page=1')
      page2 = MoviesService.get_data('movie/top_rated?page=2')

      total_results = page1[:results] + page2[:results]
      total_results.map do |result|
        Movie.new(result)
      end
    end

    def movies_by_title(title)
      page1 = MoviesService.get_data("search/movie?query=#{title}&page=1")
      page2 = MoviesService.get_data("search/movie?query=#{title}&page=2")

      total_results = page1[:results] + page2[:results]
      total_results.map do |result|
        Movie.new(result)
      end
    end

    def movie_by_id(id)
      data = MoviesService.get_data("movie/#{id}")
      Movie.new(data)
    end

    def movie_cast(id)
      movie = MoviesService.get_data("movie/#{id}/credits")
      movie[:cast][0..9]
    end

    def movie_reviews(id)
      MoviesService.get_data("movie/#{id}/reviews")
    end
  end
end
