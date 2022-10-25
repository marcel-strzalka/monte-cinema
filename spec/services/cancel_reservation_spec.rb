# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CancelReservation do
  subject(:cancel_reservation) { described_class.new(reservation:).call }

  describe '#call' do
    context 'when reservation is booked' do
      let(:reservation) { create(:reservation, status: :booked) }

      it 'updates status to canceled' do
        expect { cancel_reservation }.to(change(reservation, :status).from('booked').to('canceled'))
      end
    end

    context 'when reservation is not booked' do
      let(:reservation) { create(:reservation, status: :canceled) }

      it 'does not update status' do
        expect { cancel_reservation }.not_to(change(reservation, :status))
      end
    end
  end
end
