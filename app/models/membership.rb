# frozen_string_literal: true

class Membership < ApplicationRecord
  belongs_to :lounge

  validates_presence_of :first_name, :last_name, :email
  validates :email, uniqueness: { scope: :lounge_id, message: 'has already been taken' }
  validates :phone_number, phone: { possible: true }

  scope :active, -> { where(active: true) }

  paginates_per 10

  def self.search(search)
    where('email = ?', search) if search
  end
end
