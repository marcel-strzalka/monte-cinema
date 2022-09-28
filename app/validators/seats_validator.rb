# frozen_string_literal: true

class SeatsValidator
  def self.validate(reservation, seat_numbers)
    new(reservation, seat_numbers).validate
  end

  def validate
    if taken_seats.count == capacity
      reservation.errors.add(:base, 'Sorry, no seats are available for this show')
      return false
    end

    return false if invalid?

    return false if taken?

    true
  end

  def initialize(reservation, seat_numbers)
    @reservation = reservation
    @seat_numbers = seat_numbers

    show = reservation.show
    @taken_seats = Ticket.taken_seat_numbers(show)
    @capacity = show.hall.capacity
  end

  private

  def invalid?
    invalid = seat_numbers.any? { |seat_number| (1..capacity).exclude?(seat_number) }

    if invalid
      reservation.errors.add(:base, 'One of provided seats is invalid')
      return true
    end

    false
  end

  def taken?
    taken = seat_numbers.any? { |seat_number| taken_seats.include?(seat_number) }

    if taken
      reservation.errors.add(:base, 'One of provided seats is already taken')
      return true
    end

    false
  end

  attr_reader :reservation, :seat_numbers, :taken_seats, :capacity
end
