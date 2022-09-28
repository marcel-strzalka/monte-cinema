# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :reservations, dependent: :destroy

  enum :role, %i[customer manager]
end
