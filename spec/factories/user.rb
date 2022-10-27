# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { 'user@gmail.com' }
    password { 'rubycamp2022' }
    role { 'customer' }

    trait :manager do
      role { 'manager' }
    end
  end
end
