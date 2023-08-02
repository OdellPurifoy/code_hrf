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

  has_one_attached :logo

  validates :name, :phone_number, :description, presence: true
  validates :phone_number, phone: { possible: true }
  validates :description, length: { maximum: 500, too_long: '%<count>s characters is the maximum allowed' }
  validates :email, uniqueness: true
  validates :email,
            format: { with: /\A^(.+)@(.+)$\z/, message: 'Email invalid' },
            uniqueness: { case_sensitive: false },
            length: { minimum: 4, maximum: 255 }
end
