# frozen_string_literal: true

class Ticket < ApplicationRecord
  belongs_to :reservation

  validates :seat_number, numericality: { only_integer: true, greater_than: 0 }

  scope :taken_seat_numbers, lambda { |show|
    select(:seat_number)
    .joins(:reservation)
    .where(reservations: { show: })
    .where.not(reservations: { status: :canceled })
    .pluck(:seat_number)
  }
end
