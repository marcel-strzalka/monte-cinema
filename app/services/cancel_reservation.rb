# frozen_string_literal: true

class CancelReservation
  def call
    return unless reservation.booked?

    reservation.status = :canceled
    reservation.save
  end

  private

  def initialize(reservation:)
    @reservation = reservation
  end

  attr_reader :reservation
end
