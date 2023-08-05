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
FactoryBot.define do
  factory :event do
    name { 'MyString' }
    event_type { 'MyString' }
    event_url { 'MyString' }
    zoom_code { 'MyString' }
    rsvp_needed { false }
    maximum_capacity { 1 }
    start_time { '2023-08-04 22:45:02' }
    end_time { '2023-08-04 22:45:02' }
    members_only { false }
    is_virtual { false }
    event_description { 'MyText' }
    event_date { '2023-08-04' }
    lounge { nil }
  end
end
