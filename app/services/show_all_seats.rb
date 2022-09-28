# frozen_string_literal: true

class ShowAllSeats
  def initialize(show:)
    @show = show
  end

  def call
    seats = []

    taken_seat_numbers = Ticket
      .select(:seat_number)
      .joins(:reservation)
      .where(reservations: { show: })
      .where.not(reservations: { status: :canceled })
      .map(&:seat_number)

    (1..show.hall.capacity).each { |number| seats << Seat.new(number:, available: taken_seat_numbers.exclude?(number)) }

    seats
  end

  private

  attr_reader :show
end
