require 'rails_helper'

RSpec.describe "Create Party" do
  describe 'Happy path', :vcr do
    before :each do
      @user2 = User.create!(name: 'Burton', email: 'burton@fakeemail.com', password: 'password123', password_confirmation: 'password123')
      @user = User.create!(name: 'Pesto Besto', email: 'pesto@fakeemail.com', password: 'password123', password_confirmation: 'password123')
      visit login_path
      fill_in :email, with: @user.email
      fill_in :password, with: "password123"
      click_on "Log In"

      @movie = MoviesFacade.movie_by_id(278)
    end

    it 'can navigate to the create new party page', :vcr do
      visit movie_show_path(@movie.id)

      expect(page).to have_button("Create Viewing Party for #{@movie.title}")

      click_button "Create Viewing Party for #{@movie.title}"

      expect(current_path).to eq(new_viewing_party_path(@movie.id))
    end

    it 'has a form to create a new viewing party' do
      visit new_viewing_party_path(@movie.id)

      expect(page).to have_button('Discover Page')
      expect(page).to have_content("#{@movie.title}")
      expect(page).to have_content("Duration of party:")
      expect(page).to have_field(:movie_duration, with: 142)
      expect(page).to have_content("Day:")
      expect(page).to have_field(:date)
      expect(page).to have_content("Start time:")
      expect(page).to have_field(:time)
      expect(page).to have_content("Invite other users:")
      expect(page).to have_content(@user2.name)
      expect(page).to have_button("Create Party")
    end

    it 'creates a new viewing party and upon submit renders the party' do
      visit new_viewing_party_path(@movie.id)

      fill_in(:date, with: "2018-01-02")
      fill_in(:time, with: "04:30:00 UST")

      click_button "Create Party"

      expect(current_path).to eq(dashboard_path)

      expect(page).to have_content(@movie.title)
      expect(page).to have_content("Status: hosting")
    end

    it 'has a sad path' do
      visit new_viewing_party_path(@movie.id)

      fill_in(:time, with: "04:30:00 UST")
      click_button("Create Party")

      expect(page).to have_content("Invalid input. Please try again.")
      expect(current_path).to eq(new_viewing_party_path(@movie.id))
    end
  end
end
