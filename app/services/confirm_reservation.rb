# frozen_string_literal: true

class ConfirmReservation
  def call
    return unless reservation.booked?

    reservation.status = :confirmed
    reservation.save
  end

  private

  def initialize(reservation:)
    @reservation = reservation
  end

  attr_reader :reservation
end
