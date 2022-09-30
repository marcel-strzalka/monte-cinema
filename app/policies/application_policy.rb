# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def customer?
    user&.customer?
  end

  def manager?
    user&.manager?
  end
end
