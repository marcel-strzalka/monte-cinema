# frozen_string_literal: true

class ShowTakenSeats
  def initialize(show:)
    @show = show
  end

  def call
    Ticket
      .select(:seat_number)
      .joins(:reservation)
      .where(reservations: { show: })
      .where.not(reservations: { status: :canceled })
      .map(&:seat_number)
  end

  private

  attr_reader :show
end
