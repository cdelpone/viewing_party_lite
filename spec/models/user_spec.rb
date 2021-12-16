require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many(:party_invitees) }
    it { should have_many(:parties).through(:party_invitees) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }

    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:password_confirmation) }
    it { should validate_confirmation_of(:password).on(:create)}
    it { should validate_presence_of(:password_digest) }
    it { should have_secure_password }
  end

  describe 'methods' do
    it 'excludes self from all users list' do
      user1 = User.create!(name: 'Jane Doe', email: 'email1@fakeemail.com', password: 'password123', password_confirmation: 'password123')
      user2 = User.create!(name: 'Raychaun Williams', email: 'email2@fakeemail.com', password: 'password123', password_confirmation: 'password123')
      user3 = User.create!(name: 'Tanya Rodriguez', email: 'email3@fakeemail.com', password: 'password123', password_confirmation: 'password123')
      expect(User.all_except(user1.id)).to include(user2, user3)
    end
  end
end
