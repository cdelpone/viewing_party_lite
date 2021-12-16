class User < ApplicationRecord
  has_many :party_invitees
  has_many :parties, through: :party_invitees

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true
  validates :password_digest, presence: true
  validates :password_confirmation, presence: true, on: :create

  has_secure_password

  def self.all_except(user)
    where.not(id: user)
  end
end
