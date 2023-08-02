# == Schema Information
#
# Table name: users
#
#  id                     :uuid             not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  first_name             :string           not null
#  last_name              :string           not null
#  phone_number           :string
#  admin                  :boolean          default(FALSE)
#  date_of_birth          :date             not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :lounges, dependent: :destroy

  validates_presence_of :first_name, :last_name, :date_of_birth, presence: true
  validates :phone_number, phone: { possible: true, allow_blank: true }
  before_save :user_over_eighteen

  protected

  def user_over_eighteen
    errors.add(:date_of_birth, 'Must be 18 or older.') unless date_of_birth.before? Time.zone.now - 18.years
  end
end
