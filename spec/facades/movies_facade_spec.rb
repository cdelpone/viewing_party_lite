require 'rails_helper'

RSpec.describe 'Movies Facade', :vcr do
  it 'gets top 40 movies' do
    response = MoviesFacade.top_40

    expect(response.count).to eq(40)
  end

  xit 'gets top rated movies' do

  end
end
