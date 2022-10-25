# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MovieContract do
  let(:movie_params) { { title: 'T', length_in_minutes: 1 } }
  subject(:result) { described_class.new.call(movie_params) }

  describe '#call' do
    context 'when hall params are valid' do
      it 'returns success' do
        expect(result.success?).to be(true)
      end
    end
  end
end
