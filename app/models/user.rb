# frozen_string_literal: true

class User < ApplicationRecord
  BCRYPT_BYTESIZE_LIMIT = 72

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :reservations, dependent: :destroy

  enum :role, %i[customer manager]

  validate do
    errors.add(:base, 'Password is too long') if password.bytesize > BCRYPT_BYTESIZE_LIMIT
  end
end
