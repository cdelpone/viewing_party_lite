require 'rails_helper'

RSpec.describe Movie do
  let(:data) do
    { id: 1,
      title: "The Green Mile",
      runtime: 104,
      vote_average: 8.5,
      genre: "Drama",
      overview: "Movie about a guy"
    }
  end

  let(:movie) { Movie.new(data) }

  it 'exists' do
    expect(movie).to be_a(Movie)
  end

  it 'has attributes' do
    expect(movie.title).to eq("The Green Mile")
    expect(movie.runtime).to eq(104)
    expect(movie.vote_average).to eq(8.5)
    expect(movie.genre).to eq("Drama")
    expect(movie.overview).to eq("Movie about a guy")
  end
end
