require 'rails_helper'

RSpec.describe "user show" do
  before :each do
    @user = User.create!(name: 'Tammy Tanaka', email: 'tammy@fake_email.com')

    visit user_show_path(@user)
  end

  it 'shows user details' do
    expect(page).to have_content("Tammy Tanaka's Dashboard")
  end

  it 'has a button to discover movies', :vcr do
    expect(page).to have_button("Discover Movies")

    click_button "Discover Movies"

    expect(current_path).to eq(discover_show_path(@user))
  end

  it 'has a button to discover movies', :vcr do
    expect(page).to have_button("Discover Movies")

    click_button "Discover Movies"

    expect(current_path).to eq(discover_show_path(@user))
  end

end
