class Lounge < ApplicationRecord
  belongs_to :user

  validates :name, :phone_number, :description, presence: true
  validates :phone_number, phone: { possible: true }
  validates :description, length: { maximum: 500, too_long: '%<count>s characters is the maximum allowed' }
  validates :email, uniqueness: true
  validates :email,
            format: { with: /\A^(.+)@(.+)$\z/, message: 'Email invalid' },
            uniqueness: { case_sensitive: false },
            length: { minimum: 4, maximum: 255 }
end
