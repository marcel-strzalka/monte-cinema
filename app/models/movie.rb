# frozen_string_literal: true

class Movie < ApplicationRecord
  has_many :shows, dependent: :destroy

  scope :sorted_alphabetically, -> { order(:title) }
end
