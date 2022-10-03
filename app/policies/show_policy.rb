# frozen_string_literal: true

class ShowPolicy < ApplicationPolicy
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

  def destroy?
    manager?
  end
end
