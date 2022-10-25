# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ConfirmReservation do
  subject(:confirm_reservation) { described_class.new(reservation:).call }

  describe '#call' do
    context 'when reservation is booked' do
      let(:reservation) { create(:reservation, status: :booked) }

      it 'updates status to confirmed' do
        expect { confirm_reservation }.to change(reservation, :status)
        .from('booked').to('confirmed')
      end
    end

    context 'when reservation is not booked' do
      let(:reservation) { create(:reservation, status: :canceled) }

      it 'does not update status' do
        expect { confirm_reservation }.not_to change(reservation, :status)
      end
    end
  end
end
