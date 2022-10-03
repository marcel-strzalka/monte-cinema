# frozen_string_literal: true

class ReservationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      return scope.all if user.manager?

      scope.where(user_id: user.id)
    end
  end

  def show?
    customer? || manager?
  end

  def new?
    customer? || manager?
  end

  def create?
    customer? || manager?
  end

  def cancel?
    customer? || manager?
  end

  def confirm?
    manager?
  end
end
