# frozen_string_literal: true

class Reservation < ApplicationRecord
  belongs_to :show
  belongs_to :user
  has_many :tickets, dependent: :destroy

  enum :status, %i[canceled booked confirmed]

  scope :relevant_for, lambda { |user|
    joins(:user, :show)
    .where(user:)
    .where('shows.start_time > ?', Time.zone.now)
    .where.not(status: :canceled)
    .order(:start_time)
  }

  scope :for, lambda { |show|
    joins(:show)
    .where(show:)
    .where.not(status: :canceled)
    .order(:status)
  }
end
