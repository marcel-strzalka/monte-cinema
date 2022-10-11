# frozen_string_literal: true

FactoryBot.define do
  factory :ticket do
    reservation
    seat_number { 1 }
  end
end
