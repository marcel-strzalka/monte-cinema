# frozen_string_literal: true

class CancelReservation
  def initialize(reservation:)
    @reservation = reservation
  end

  def call
    return unless reservation.booked?

    reservation.status = :canceled
    reservation.save
  end

  private

  attr_reader :reservation
end
