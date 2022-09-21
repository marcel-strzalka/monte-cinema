# frozen_string_literal: true

module ApplicationHelper
  def formatted_time(datetime)
    datetime.strftime('%H:%M')
  end
end
