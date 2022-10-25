# frozen_string_literal: true

class HallContract < ApplicationContract
  option :hall

  params do
    required(:name).filled(:string)
    required(:capacity).value(:integer, gt?: 0)
  end

  rule(:name) do
    key.failure('is taken') if Hall.where.not(id: hall.id).exists?(name: value)
  end
end
