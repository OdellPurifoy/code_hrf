# frozen_string_literal: true

# == Schema Information
#
# Table name: memberships
#
#  id           :uuid             not null, primary key
#  first_name   :string           not null
#  last_name    :string           not null
#  email        :string           not null
#  phone_number :string
#  do_not_text  :boolean          default(FALSE)
#  do_not_email :boolean          default(FALSE)
#  active       :boolean          default(TRUE)
#  lounge_id    :uuid             not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Membership < ApplicationRecord
  belongs_to :lounge

  validates_presence_of :first_name, :last_name, :email
  validates :email, uniqueness: { scope: :lounge_id, message: 'has already been taken' }
  # validates :phone_number, phone: { possible: true }

  scope :active, -> { where(active: true) }

  paginates_per 10

  def self.search(search)
    where('email = ?', search) if search
  end
end
