# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    title { Faker::Color.color_name }
    description { Faker::Lorem.sentence }
    icon_url { 'https://fonts.gstatic.com/s/i/materialicons/info/v18/24px.svg' }
    user { nil }

    trait :private do
      user
    end
  end
end
