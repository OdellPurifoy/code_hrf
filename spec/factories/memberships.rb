# frozen_string_literal: true

FactoryBot.define do
  factory :membership do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    phone_number { '9008007000' }
    do_not_text { false }
    do_not_email { false }
    active { false }
    lounge
  end
end
