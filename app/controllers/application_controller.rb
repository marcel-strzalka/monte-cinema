# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_back fallback_location: root_path
  end

  def customer?
    current_user&.customer?
  end

  def manager?
    current_user&.manager?
  end

  helper_method :customer?, :manager?
end
