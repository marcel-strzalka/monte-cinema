# frozen_string_literal: true

# This controller is a workaround for a currently (05.10.22) existing bug related to
# Turbo and Devise. Without it flash messages in login and registration forms are
# not displayed at all which is quite confusing to potential users.
#
# Fixed thanks to: https://github.com/hotwired/turbo/issues/45#issuecomment-753370898
#
# TODO: Remove this workaround when the following issue is resolved:
# https://github.com/heartcombo/devise/issues/5446

class TurboController < ApplicationController
  class Responder < ActionController::Responder
    def to_turbo_stream
      controller.render(options.merge(formats: :html))
    rescue ActionView::MissingTemplate => e
      raise e if get?

      if has_errors? && default_action
        render rendering_options.merge(formats: :html, status: :unprocessable_entity)
      else
        redirect_to navigation_location
      end
    end
  end

  self.responder = Responder
  respond_to :html, :turbo_stream
end
