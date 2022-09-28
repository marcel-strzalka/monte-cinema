# frozen_string_literal: true

class ConfirmReservation
  def initialize(reservation:)
    @reservation = reservation
  end

  def call
    return unless reservation.booked?

    reservation.status = :confirmed
    reservation.save
  end

  private

  attr_reader :reservation
end
