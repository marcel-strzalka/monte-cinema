class Movie < ApplicationRecord
  validates :title, length: { minimum: 1 }
  validates :length_in_minutes, numericality: { in: 1..300 }
end
