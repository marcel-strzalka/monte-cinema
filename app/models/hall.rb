class Hall < ApplicationRecord
  validates :name, uniqueness: true, length: { minimum: 1 }
  validates :capacity, numericality: { only_integer: true, greater_than: 0 }
end
