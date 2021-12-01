require 'rails_helper'

RSpec.describe "viewing party create" do
  describe 'the new viewing party' do
    before(:each) do
      @user = User.create!(name: 'Tammy Tanaka', email: 'tammy@fake_email.com')
      @movie = MoviesFacade.movie_by_id(278)
    end

    it 'renders the new form', :vcr do
      visit movie_show_path(@user, @movie)

      expect(page).to have_button("Create Viewing Party for #{@movie[:original_title]}")
      click_button "Create Viewing Party for #{@movie[:original_title]}"
      expect(current_path).to eq("/users/#{@user.id}/movies/#{@movie[:id]}/viewing_party/new")
    end
  end

  describe 'viewing party create', :vcr do
    before(:each) do
      @user = User.create!(name: 'Tammy Tanaka', email: 'tammy@fake_email.com')
      @movie = MoviesFacade.movie_by_id(278)
    end

    it 'creates a new viewing party' do
      visit "/users/#{@user.id}/movies/#{@movie[:id]}/viewing_party/new"

      expect(page).to have_button("Discover Page")
      expect(page).to have_content("#{@movie[:original_title]}")
    end
  end
end
