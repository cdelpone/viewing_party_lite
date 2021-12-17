require 'rails_helper'
# ber spec/features/users/login_spec.rb
RSpec.describe "User Log In" do
  describe 'Happy path' do
    it 'has a link to login user' do
      @user = User.create!(name: 'Pesto Besto', email: 'pesto@fakeemail.com', password: 'password123', password_confirmation: 'password123')

      visit root_path

      expect(page).to have_link("Log In")

      click_link "Log In"

      expect(current_path).to eq(login_path)

      fill_in :email, with: @user.email
      fill_in :password, with: "password123"

      click_on "Log In"

      expect(current_path).to eq(dashboard_path)
    end

    it 'wont login in with bad credentials - email' do
      user = User.create!(name: 'Pesto Besto', email: 'pesto@fakeemail.com', password: 'password123', password_confirmation: 'password123')

      visit root_path

      expect(page).to have_link("Log In")

      click_link "Log In"

      expect(current_path).to eq(login_path)

      fill_in :email, with: "bad_email@fake_email.com"
      fill_in :password, with: "password123"

      click_on "Log In"

      expect(current_path).to eq(login_path)
      expect(page).to have_content("bad credentials, try again.")
    end

    it 'wont login in with bad credentials - password' do
      user = User.create!(name: 'Pesto Besto', email: 'pesto@fakeemail.com', password: 'password123', password_confirmation: 'password123')

      visit root_path

      expect(page).to have_link("Log In")

      click_link "Log In"

      expect(current_path).to eq(login_path)

      fill_in :email, with: "pesto@fake_email.com"
      fill_in :password, with: "wrongpassword"

      click_on "Log In"

      expect(current_path).to eq(login_path)
      expect(page).to have_content("bad credentials, try again.")
    end
  end
end
