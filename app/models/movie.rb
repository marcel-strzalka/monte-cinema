# frozen_string_literal: true

class Movie < ApplicationRecord
  has_many :shows, dependent: :destroy

  validates :title, length: { minimum: 1 }
  validates :length_in_minutes, numericality: { in: 1..300 }

  scope :sorted_alphabetically, -> { order(:title) }
end
