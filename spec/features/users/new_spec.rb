require 'rails_helper'

RSpec.describe "New User" do
  describe 'New user' do
    it 'renders the new form' do
      visit root_path

      expect(page).to have_button('Create New User')

      click_button 'Create New User'

      expect(current_path).to eq(register_path)
    end

    it 'doesnt store passwords' do
      user = User.create(name: 'Meg', email: 'meg@test.com', password: 'password123', password_confirmation: 'password123')
      expect(user).to_not have_attribute(:password)
      expect(user.password_digest).to_not eq('password123')
    end

    it 'creates a new user' do
      visit register_path
      fill_in 'Name', with: 'Tammy Tanaka'
      fill_in 'Email', with:'tammy@fake_email.com'
      click_button 'Save'

      expect(page).to have_content("Tammy Tanaka's Dashboard")
      expect(page).to have_button("Discover Movies")
      expect(page).to have_content("Viewing Parties")
    end

    it 'has a sad path' do
      visit register_path
      fill_in "Name", with: "Tammy Tanaka"
      click_button "Save"

      expect(page).to have_content("Please enter valid data")
      expect(current_path).to eq(register_path)
    end
  end
end
