# frozen_string_literal: true

class Ticket < ApplicationRecord
  belongs_to :reservation

  validates :seat_number, numericality: { only_integer: true, greater_than: 0 }
end
