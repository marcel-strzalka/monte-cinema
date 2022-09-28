# frozen_string_literal: true

class CreateReservation
  def initialize(reservation:, params:)
    @reservation = reservation
    @seat_numbers = params.key?(:seat_numbers) ? params[:seat_numbers].map(&:to_i) : []
  end

  def call
    if seat_numbers.empty?
      reservation.errors.add(:base, 'You need to pick at least one seat')
      return false
    end

    valid = SeatsValidator.validate(reservation, seat_numbers)

    return false unless valid

    create
  end

  private

  def create
    ActiveRecord::Base.transaction do
      reservation.save

      seat_numbers.each do |seat_number|
        Ticket.create(reservation:, seat_number:)
      end
    end

    true
  end

  attr_reader :reservation, :seat_numbers
end
