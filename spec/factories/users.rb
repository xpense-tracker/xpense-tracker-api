# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email(name: name) }
    name  { Faker::Name.name }
    password { '123456' }
  end
end
