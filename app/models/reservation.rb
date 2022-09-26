# frozen_string_literal: true

class Reservation < ApplicationRecord
  belongs_to :show
  belongs_to :user
  has_many :tickets, dependent: :destroy

  enum :status, %i[canceled booked confirmed]
end
