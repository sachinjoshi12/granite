# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    # content { "MyText" }
    # task { nil }
    # user { nil }
    content { Faker::Lorem.paragraph }
    # association :user, factory: :user
    # association :task, factory: :user
    user
    task
  end
end
