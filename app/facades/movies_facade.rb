class MoviesFacade
  class << self
    def top_40
      page_1 = MoviesService.get_data('movie/top_rated?page=1')
      page_2 = MoviesService.get_data('movie/top_rated?page=2')

      page_1[:results] + page_2[:results]
    end

    def movies_by_title(title)
      page_1 = MoviesService.get_data("search/movie?query=#{title}&page=1")
      page_2 = MoviesService.get_data("search/movie?query=#{title}&page=2")

      page_1[:results] + page_2[:results]
    end

    def movie_by_id(id)
      MoviesService.get_data("movie/#{id}")
    end

    def movie_cast(id)
      movie = MoviesService.get_data("movie/#{id}/credits")
      movie[:cast][0..9]
    end

    def movie_reviews(id)
      movie = MoviesService.get_data("movie/#{id}/reviews")
    end

    # def movie_image(id)
    #   @movie_images = MoviesService.get_data("movie/#{id}/images")
    #
    # end
  end
end
