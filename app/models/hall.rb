# frozen_string_literal: true

class Hall < ApplicationRecord
  has_many :shows, dependent: :destroy

  scope :sorted_alphabetically, -> { order(:name) }
end
