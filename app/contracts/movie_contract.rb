# frozen_string_literal: true

class MovieContract < ApplicationContract
  params do
    required(:title).filled(:string)
    required(:length_in_minutes).value(:integer, gteq?: 1, lteq?: 300)
  end
end
