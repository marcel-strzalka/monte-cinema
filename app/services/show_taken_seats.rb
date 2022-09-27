# frozen_string_literal: true

class ShowTakenSeats
  def call
    Ticket
      .select(:seat_number)
      .joins(:reservation)
      .where(reservations: { show: })
      .where.not(reservations: { status: :canceled })
      .map(&:seat_number)
  end

  private

  def initialize(show)
    @show = show
  end

  attr_reader :show
end
