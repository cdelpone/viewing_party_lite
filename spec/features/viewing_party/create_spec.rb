require 'rails_helper'

RSpec.describe "viewing party create" do
  describe 'the new viewing party' do
    before(:each) do
      @user = User.create!(name: 'Tammy Tanaka', email: 'tammy@fake_email.com')
      @movie = MoviesFacade.movie_by_id(278)
      visit movie_show_path(@user, @movie)
    end

    it 'renders the new form', :vcr do
      expect(page).to have_button("Create Viewing Party for #{@movie[:original_title]}")
      click_button "Create Viewing Party for #{@movie[:original_title]}"
      expect(current_path).to eq(new_viewing_party_path(@user, @movie))
    end
  end

  # describe 'user create' do
  #   it 'creates a new user' do
  #     visit register_path
  #     fill_in "Name", with: "Tammy Tanaka"
  #     fill_in "Email", with: "tammy@fake_email.com"
  #     click_button "Save"
  #     end
  # end
end
