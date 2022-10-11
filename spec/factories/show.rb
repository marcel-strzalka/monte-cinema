# frozen_string_literal: true

FactoryBot.define do
  factory :show do
    hall
    movie
    start_time { Time.zone.now.midnight + 1.day }
  end
end
