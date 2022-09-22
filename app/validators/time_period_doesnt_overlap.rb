# frozen_string_literal: true

class TimePeriodDoesntOverlap
  def self.validate(show)
    shows = Show.where(hall_id: show.hall)

    overlaps = shows.any? do |other|
      show.time_period.overlaps?(other.time_period)
    end

    show.errors.add(:overlapping_time_period, 'cannot be added') if overlaps

    !overlaps
  end
end
