# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HallContract do
  let(:hall_params) { { name: 'H', capacity: 1 } }
  subject { described_class.new(hall: Hall.new).call(hall_params) }

  describe '#call' do
    context 'when name is already taken' do
      let!(:hall) { create :hall, name: 'H' }

      it 'returns failure' do
        expect(subject.failure?).to be(true)
      end

      it 'adds an error' do
        expect(subject.errors.to_h).to eq({ name: ['is taken'] })
      end
    end

    context 'when hall params are valid' do
      it 'returns success' do
        expect(subject.success?).to be(true)
      end
    end
  end
end
