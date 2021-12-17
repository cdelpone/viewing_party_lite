require 'rails_helper'

RSpec.describe 'Welcome' do
  before :each do
    visit root_path
  end

  it 'welcome page lingo with links' do
    expect(page).to have_content('Viewing Party Lite')
    expect(page).to have_link('Home')
    expect(page).to have_link('New to Viewing Party? Register Here')
    expect(page).to have_link('Log In')
  end

  it "links to register" do
    click_on "New to Viewing Party? Register Here"

    expect(current_path).to eq(register_path)
  end

  it "links to login" do
    click_on "Log In"

    expect(current_path).to eq(login_path)
  end

  it 'logged in user sees link to log out' do
    @user = User.create!(name: 'Pesto Besto', email: 'pesto@fakeemail.com', password: 'password123', password_confirmation: 'password123')
    visit login_path
    fill_in :email, with: @user.email
    fill_in :password, with: "password123"
    click_on "Log In"
    visit root_path

    expect(page).to have_link("Log Out")
    expect(page).to_not have_link("Log In")

    click_on "Log Out"

    expect(current_path).to eq(root_path)
    expect(page).to have_link('New to Viewing Party? Register Here')
    expect(page).to have_link('Log In')
    expect(page).to_not have_link("Log Out")

  end

  it 'does not have log out when logged in' do
    @user = User.create!(name: 'Pesto Besto', email: 'pesto@fakeemail.com', password: 'password123', password_confirmation: 'password123')
    visit login_path
    fill_in :email, with: @user.email
    fill_in :password, with: "password123"
    click_on "Log In"

    expect(page).to_not have_link("Log Out")
  end
end
####### notes from class #######
# if session[:user_id] render logout_path else render login_path
# <% if current_user %>
#  <%= link_to "Log Out", '/logout', method: :delete %>
# else
#     <%= link_to  "Register", '/register' %>
#     <%= link_to "Log In", '/login' %>
# with sessions testing need to login and get session started for the user
# (before each)
# click submit

####### former main index #######
# <h1>Viewing Party Lite</h1>
# <%= link_to "Create New User", register_path %>
# <h3>Existing Users:</h3>
# <% @users.each do |user| %>
#   <%= link_to "#{user.name}'s Dashboard", dashboard_path %><br>
# <% end %>
