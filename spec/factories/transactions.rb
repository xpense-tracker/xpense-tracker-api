# frozen_string_literal: true

FactoryBot.define do
  factory :transaction do
    user
    category
    amount { Money.new(1_00, 'USD') }
  end
end
