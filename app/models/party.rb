# frozen_string_literal: true

class Party < ApplicationRecord
  has_many :party_invitees
  has_many :users, through: :party_invitees

  validates_presence_of :name
  validates_presence_of :date
  validates_presence_of :time
end
