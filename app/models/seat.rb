# frozen_string_literal: true

class Seat
  def initialize(number:, available:)
    @number = number
    @available = available
  end

  attr_reader :number, :available
end
