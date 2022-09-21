# frozen_string_literal: true

class Show < ApplicationRecord
  belongs_to :hall
  belongs_to :movie

  validates :start_time, presence: true
  validates :start_time, comparison: { greater_than: Time.zone.now }

  scope :today_shows, lambda { |movie|
    where(movie:).where(start_time: (Time.zone.now..Time.zone.now.midnight + 1.day)).order(:start_time)
  }

  def end_time
    start_time + movie.length_in_minutes.minutes + ADS_TIME
  end

  def time_period
    start_time..end_time
  end

  def time_period_doesnt_overlap?
    shows = Show.where(hall_id:)

    overlaps = shows.any? do |show|
      time_period.overlaps?(show.time_period)
    end

    errors.add(:overlapping_time_period, 'cannot be added') if overlaps

    !overlaps
  end
end
