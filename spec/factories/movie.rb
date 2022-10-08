# frozen_string_literal: true

FactoryBot.define do
  factory :movie do
    title { 'Title' }
    length_in_minutes { 100 }
  end
end
