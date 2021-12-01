require 'rails_helper'

RSpec.describe 'Movie show page' do
  before(:each) do
    @user = User.create!(name: 'Tammy Tanaka', email: 'tammy@fake_email.com')
    @movie = MoviesFacade.movie_by_id(278)
    @movie_cast = MoviesFacade.movie_cast(278)
    @movie_reviews = MoviesFacade.movie_reviews(278)
    @hours = @movie[:runtime]/60
    @minutes = (@movie[:runtime].to_f%60).to_i
    visit "/users/#{@user.id}/movies/#{@movie[:id]}"
  end

  xit 'has button to return to discover page' do
    expect(page).to have_button("Discover Page")

    click_button "Discover Page"

    expect(current_path).to eq("/users/#{@user.id}/discover")
  end

  it 'has movie details from API', :vcr do
    expect(page).to have_content(@movie[:original_title])
    expect(page).to have_content(@movie[:vote_average])
    expect(page).to have_content("Drama")
    expect(page).to have_content("Runtime")
    expect(page).to have_content(@hours)
    expect(page).to have_content(@minutes)
    expect(page).to have_content(@movie[:overview])
    expect(page).to have_content("Andy Dufresne")
    expect(page).to have_content("John Chard")
  end
end
