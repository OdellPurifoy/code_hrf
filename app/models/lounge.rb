# frozen_string_literal: true

# == Schema Information
#
# Table name: lounges
#
#  id                      :uuid             not null, primary key
#  name                    :string           not null
#  phone_number            :string           not null
#  email                   :string           not null
#  description             :text
#  user_id                 :uuid             not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  alcohol_served          :boolean          default(FALSE)
#  food_served             :boolean          default(FALSE)
#  outside_alcohol_allowed :boolean          default(FALSE)
#  outside_cigars_allowed  :boolean          default(FALSE)
#
class Lounge < ApplicationRecord
  belongs_to :user

  has_one :address, dependent: :destroy, inverse_of: :lounge
  has_many :events, dependent: :destroy
  has_many :memberships, dependent: :destroy
  has_many :special_offers, dependent: :destroy

  accepts_nested_attributes_for :address

  has_one_attached :logo do |attachable|
    attachable.variant :thumb, resize_to_limit: [100,100]
  end

  validates :name, :phone_number, :description, presence: true
  validates :description, length: { maximum: 500, too_long: '%<count>s characters is the maximum allowed' }
  validates :email, uniqueness: true
  validates :email,
            format: { with: /\A^(.+)@(.+)$\z/, message: 'Email invalid' },
            uniqueness: { case_sensitive: false },
            length: { minimum: 4, maximum: 255 }
end
