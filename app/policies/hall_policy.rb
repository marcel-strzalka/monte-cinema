# frozen_string_literal: true

class HallPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def new?
    manager?
  end

  def create?
    manager?
  end

  def edit?
    manager?
  end

  def update?
    manager?
  end

  def destroy?
    manager?
  end
end
