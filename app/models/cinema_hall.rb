class CinemaHall < ApplicationRecord
  validates :name, length: { minimum: 1 }
  validates :capacity, numericality: { greater_than: 0 }
end
