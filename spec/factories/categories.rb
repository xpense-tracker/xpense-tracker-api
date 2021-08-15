FactoryBot.define do
  factory :category do
    title { "MyString" }
    description { "MyText" }
    icon_url { "MyString" }
    user { nil }

    trait :private do
       user
    end
  end
end
