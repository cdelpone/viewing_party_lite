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
  end
end
