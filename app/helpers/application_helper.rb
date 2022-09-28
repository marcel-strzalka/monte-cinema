# frozen_string_literal: true

module ApplicationHelper
  def formatted_time(datetime)
    datetime.strftime('%H:%M')
  end

  def formatted_date(datetime)
    datetime.strftime('%e %B %Y')
  end
end
