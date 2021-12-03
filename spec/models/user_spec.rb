# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many(:party_invitees) }
    it { should have_many(:parties).through(:party_invitees) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
  end

  describe 'methods' do
    it 'excludes self from all users list' do
      user1 = User.create!(name: 'Jane Doe', email: 'email1@fakeemail.com')
      user2 = User.create!(name: 'Raychaun Williams', email: 'email2@fakeemail.com')
      user3 = User.create!(name: 'Tanya Rodriguez', email: 'email3@fakeemail.com')
      expect(User.all_except(user1.id)).to include(user2, user3)
    end
  end
end
