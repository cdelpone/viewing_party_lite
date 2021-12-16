

require 'rails_helper'

RSpec.describe MoviesService, :vcr do
  it 'data from API' do
    response = MoviesService.get_data('movie/top_rated')

    expect(response).to be_a(Hash)
    expect(response[:results]).to be_an(Array)
    expect(response).to have_key(:page)
    expect(response).to have_key(:results)
    expect(response).to have_key(:total_pages)
    expect(response).to have_key(:total_results)
  end

  it 'gets top rated movies' do
    response = MoviesService.get_data('movie/top_rated')

    response[:results].each do |movie|
      expect(movie).to have_key(:backdrop_path)
      expect(movie).to have_key(:genre_ids)
      expect(movie).to have_key(:id)
      expect(movie).to have_key(:original_title)
      expect(movie).to have_key(:overview)
      expect(movie).to have_key(:poster_path)
      expect(movie).to have_key(:title)
      expect(movie).to have_key(:vote_average)
    end
  end
end
