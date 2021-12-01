require 'rails_helper'

RSpec.describe 'Discover page' do
  before(:each) do
    @user = User.create!(name: 'Tammy Tanaka', email: 'tammy@fake_email.com')
  end
  it 'shows discover page' do
    visit "/users/#{@user.id}/discover"

    expect(page).to have_content('Discover Movies')
    expect(page).to have_button("Find Top Rated Movies")
    expect(page).to have_button("Find Movies")
  end

  it 'can go to top rated movies page' do
    visit "/users/#{@user.id}/discover"

    click_button "Find Top Rated Movies"
    expect(current_path).to eq("/users/#{@user.id}/movies")
  end
end
