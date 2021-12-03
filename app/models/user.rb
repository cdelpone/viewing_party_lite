class User < ApplicationRecord
  has_many :party_invitees
  has_many :parties, through: :party_invitees

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  def self.all_except(user)
    where.not(id: user)
  end
end
