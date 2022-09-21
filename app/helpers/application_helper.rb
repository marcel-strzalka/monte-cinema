# frozen_string_literal: true

module ApplicationHelper
  def pretty_time(datetime)
    datetime.strftime('%H:%M')
  end
end
