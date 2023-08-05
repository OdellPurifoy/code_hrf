# frozen_string_literal: true

# == Schema Information
#
# Table name: events
#
#  id                :uuid             not null, primary key
#  name              :string           not null
#  event_type        :string           not null
#  event_url         :string
#  zoom_code         :string
#  rsvp_needed       :boolean          default(FALSE), not null
#  maximum_capacity  :integer
#  start_time        :time             not null
#  end_time          :time             not null
#  members_only      :boolean          default(FALSE), not null
#  is_virtual        :boolean
#  event_description :text             not null
#  event_date        :date             not null
#  lounge_id         :uuid             not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class Event < ApplicationRecord
  belongs_to :lounge

  TYPES = ['Live Music', 'Whiskey Tasting', 'Cigar Brand Event', 'Holiday', 'Sports', 'Virtual'].freeze

  belongs_to :lounge
  # has_many :rsvps, dependent: :destroy

  has_one_attached :flyer
  validates_presence_of :name, :event_type, :start_time, :end_time, :event_date
  validates :event_url, url: true, if: proc { |event| event.is_virtual }
  validates :event_url, presence: true, if: proc { |event| event.is_virtual }
  validates :event_description, length: { maximum: 2000, too_long: '%<count>s characters is the maximum allowed' }
end
