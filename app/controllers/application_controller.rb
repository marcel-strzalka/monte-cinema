# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def customer?
    current_user&.customer?
  end

  def manager?
    current_user&.manager?
  end
end
