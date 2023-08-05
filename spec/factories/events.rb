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
