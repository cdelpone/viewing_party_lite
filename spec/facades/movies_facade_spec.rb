require 'rails_helper'

RSpec.describe 'Movies Facade', :vcr do
  it 'gets top 40 movies' do
    response = MoviesFacade.top_40

    expect(response.count).to eq(40)
  end

  it 'returns searched movies' do
    response = MoviesFacade.movies_by_title("Shawshank")

    require "pry"; binding.pry
  end
end
