# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def is_customer?
    current_user&.customer?
  end

  def is_manager?
    current_user&.manager?
  end
end
