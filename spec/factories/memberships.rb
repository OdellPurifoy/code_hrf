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
