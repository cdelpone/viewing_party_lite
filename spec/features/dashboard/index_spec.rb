require 'rails_helper'

RSpec.describe 'Dashboard' do
  before :each do
    @user = User.create!(name: 'Pesto Besto', email: 'pesto@fakeemail.com', password: 'password123', password_confirmation: 'password123')
    visit login_path
    fill_in :email, with: @user.email
    fill_in :password, with: "password123"
    click_on "Log In"

    visit '/dashboard'
  end

  it 'validates registered user' do
  end

  it 'has user info' do
    expect(page).to have_link('Home')
    expect(page).to have_content("Pesto Besto's Dashboard")
  end
end
