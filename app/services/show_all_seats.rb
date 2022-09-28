# frozen_string_literal: true

class ShowAllSeats
  def initialize(show:)
    @show = show
  end

  def call
    seats = []

    taken_seat_numbers = Ticket.taken_seat_numbers(show)

    (1..show.hall.capacity).each do |number|
      seats << Seat.new(number:, available: taken_seat_numbers.exclude?(number))
    end

    seats
  end

  private

  attr_reader :show
end
