class User < ApplicationRecord
  has_many :party_invitees
  has_many :parties, through: :party_invitees

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
