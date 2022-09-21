# frozen_string_literal: true

class Hall < ApplicationRecord
  has_many :shows, dependent: :destroy

  validates :name, uniqueness: true, length: { minimum: 1 }
  validates :capacity, numericality: { only_integer: true, greater_than: 0 }

  scope :sorted_alphabetically, -> { order(:name) }
end
