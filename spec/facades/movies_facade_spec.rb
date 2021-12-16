

require 'rails_helper'

RSpec.describe 'Movies Facade', :vcr do
  it 'gets top 40 movies' do
    response = MoviesFacade.top_40

    expect(response.first).to be_a(Movie)
  end

  it 'returns searched movies' do
    response = MoviesFacade.movies_by_title('Shawshank')

    expect(response.first.title).to include('Shawshank Redemption')
    expect(response.first).to be_a(Movie)
  end

  it 'returns movie by id' do
    response = MoviesFacade.movie_by_id(278)

    expect(response.id).to eq(278)
    expect(response).to be_a(Movie)
  end

  it 'returns movie cast' do
    response = MoviesFacade.movie_cast(278)

    expect(response.first[:name]).to eq('Tim Robbins')
    expect(response.count).to eq(10)
    expect(response).to be_an(Array)
  end

  it 'returns movie reviews' do
    response = MoviesFacade.movie_reviews(278)

    expect(response[:total_results]).to eq(7)
    expect(response[:results].first[:author]).to eq('elshaarawy')
    expect(response).to be_a(Hash)
  end
end
