require 'rails_helper'

RSpec.describe 'Top rated movies page' do
  before(:each) do
    @user = User.create!(name: 'Tammy Tanaka', email: 'tammy@fake_email.com')
  end

  it 'has button to return to discover page' do

    visit "/users/#{@user.id}/movies"

    expect(page).to have_button("Discover Page")

    click_button "Discover Page"

    expect(current_path).to eq("/users/#{@user.id}/discover")
  end
end
