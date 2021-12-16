require 'rails_helper'

RSpec.describe 'Dashboard' do
  it 'has project title' do
    visit '/'

    expect(page).to have_content('Viewing Party Lite')
    expect(page).to have_link('Home')
    expect(page).to have_content('Existing Users:')
    expect(page).to have_button("Create New User")
  end

  context "User registration form" do
    # visit register_path
    # As a visitor
    # When I visit `/register`
    # I see a form to fill in my name, email, password, and password confirmation.
    # When I fill in that form with my name, email, and matching passwords,
    # I'm taken to my dashboard page `/users/:id`

    it "creates new user" do
      visit root_path

      click_on "Register as a User"

      expect(current_path).to eq(new_users_path)

      username = "funbucket13"
      password = "test"

      fill_in :username, with: username
      fill_in :password, with: password

      click_on "Create User"

      expect(page).to have_content("Welcome, #{username}!")
    end
  end
end
