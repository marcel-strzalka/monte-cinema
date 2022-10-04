# frozen_string_literal: true

class TimePeriodDoesntOverlap
  def self.validate(show)
    new(show).validate
  end

  def validate
    overlaps = overlaps?

    @show.errors.add(:overlapping_time_period, 'cannot be added') if overlaps

    !overlaps
  end

  def initialize(show)
    @show = show
  end

  private

  def shows
    Show.where(hall: @show.hall)
  end

  def overlaps?
    shows.any? do |other|
      @show.time_period.overlaps?(other.time_period)
    end
  end
end
