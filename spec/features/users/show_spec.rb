require 'rails_helper'
# ber spec/features/users/show_spec.rb
RSpec.describe "User Show/Dashboard" do
  before :each do
    @user2 = User.create!(name: 'Burton', email: 'burton@fakeemail.com', password: 'password123', password_confirmation: 'password123')
    @user = User.create!(name: 'Pesto Besto', email: 'pesto@fakeemail.com', password: 'password123', password_confirmation: 'password123')
    visit login_path
    fill_in :email, with: @user.email
    fill_in :password, with: "password123"
    click_on "Log In"

    visit dashboard_path
  end

  it 'shows user details' do
    expect(page).to have_content("Pesto Besto's Dashboard")
    expect(page).to_not have_content("Burton's Dashboard")
  end

  it 'has a button to discover movies' do
    expect(page).to have_button('Discover Movies')

    click_button 'Discover Movies'

    expect(current_path).to eq(discover_show_path(@user))
  end

  it 'lists a users parties', :vcr do
    expect(page).to have_content('Viewing Parties')

    movie = Movie.new({ id: 1,
      title: "The Green Mile",
      runtime: 104,
      vote_average: 8.5,
      genres: "Drama",
      overview: "Movie about a guy"
    })

    party = Party.create!(name: movie.title, movie_id: movie.id, date: "2021-12-25", time:"13:21:00", movie_duration: '104', user_id: @user.id)
    party_invitee = PartyInvitee.create!(user_id: @user.id, party_id: party.id)

    visit(current_path)

    expect(page).to have_content(party.name)
  end
end
