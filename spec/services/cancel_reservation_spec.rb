# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CancelReservation do
  subject { described_class.new(reservation:).call }

  describe '#call' do
    context 'when reservation is booked' do
      let(:reservation) { Reservation.new(status: :booked) }

      it 'updates status to canceled' do
        expect { subject }.to change { reservation.status }.from('booked').to('canceled')
      end
    end

    context 'when reservation is not booked' do
      let(:reservation) { Reservation.new(status: :canceled) }

      it 'does nothing' do
        expect { subject }.to_not(change { reservation.status })
      end
    end
  end
end
