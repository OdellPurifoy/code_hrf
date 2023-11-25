# frozen_string_literal: true

FactoryBot.define do
  factory :notification do
    body { Faker::Lorem.paragraph }
    read { false }
    user
  end
end
