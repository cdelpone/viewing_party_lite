require 'rails_helper'
# ber spec/features/users/new_spec.rb
RSpec.describe "New User" do
  describe 'Happy path' do
    it 'has a link to register new user' do
      visit root_path

      expect(page).to have_link("New to Viewing Party? Register Here")

      click_on "New to Viewing Party? Register Here"

      expect(current_path).to eq(register_path)
    end

    it 'doesnt store passwords' do
      user = User.create!(name: 'Pesto Besto', email: 'pesto@fakeemail.com', password: 'password123', password_confirmation: 'password123')

      expect(user).to_not have_attribute(:password)
      expect(user.password_digest).to_not eq('password123')
    end

    it 'creates a new user' do
      visit register_path

      fill_in :name, with: 'Burton'
      fill_in :email, with:'burton@fake_email.com'
      fill_in :password, with:'password123'
      fill_in :password_confirmation, with:'password123'

      click_button 'Save'

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Burton's Dashboard")
      expect(page).to have_button("Discover Movies")
      expect(page).to have_content("Viewing Parties")
    end
  end

  describe 'Sad path' do
    it 'wont create user with unmatching passwords' do
      visit register_path

      fill_in :name, with: 'Burton'
      fill_in :email, with:'burton@fake_email.com'
      fill_in :password, with:'password123'
      fill_in :password_confirmation, with:'unmatchingpassword'

      click_button 'Save'

      expect(current_path).to eq(register_path)
      expect(page).to have_content("Password and password confirmation must match")
    end

    it 'wont create user without all fields filled in' do
      visit register_path

      fill_in :name, with: "Burton"

      click_button "Save"

      expect(page).to have_content("All fields must be complete and valid")
      expect(current_path).to eq(register_path)
    end
  end
end
