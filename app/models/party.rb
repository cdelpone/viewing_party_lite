class Party < ApplicationRecord
  has_many :party_invitees, dependent: :destroy
  has_many :users, through: :party_invitees

  validates_presence_of :date
  validates_presence_of :time
  validates_presence_of :movie_id
end
