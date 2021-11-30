require 'rails_helper'

RSpec.describe 'Discover page' do
  it 'shows discover page' do
    user = User.create!(name: 'Tammy Tanaka', email: 'tammy@fake_email.com')

    visit "/user/#{user.id}/discover"

    expect(page).to have_content('Discover Movies')
    expect(page).to have_button("Find Top Rated Movies")
  end
end
