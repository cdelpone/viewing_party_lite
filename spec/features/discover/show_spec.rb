require 'rails_helper'
# ber spec/features/discover/show_spec.rb
RSpec.describe 'Discover page' do
  before :each do
    @user = User.create!(name: 'Pesto Besto', email: 'pesto@fakeemail.com', password: 'password123', password_confirmation: 'password123')
    visit login_path
    fill_in :email, with: @user.email
    fill_in :password, with: "password123"
    click_on "Log In"

    visit discover_show_path(@user)
  end

  it 'shows discover page' do
    expect(page).to have_content('Discover Movies')
    expect(page).to have_button('Find Top Rated Movies')
    expect(page).to have_button('Find Movies')
  end

  it 'can go to top rated movies page', :vcr do
    click_button 'Find Top Rated Movies'

    expect(current_path).to eq(movie_index_path(@user))
  end
end
