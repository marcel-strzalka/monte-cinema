# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CreateReservation do
  subject(:create_reservation) { described_class.new(reservation:, seat_numbers:).call }

  let(:hall) { create(:hall) }
  let(:movie) { create(:movie) }
  let(:show) { create(:show) }
  let(:user) { create(:user) }
  let(:reservation) { build(:reservation, show:, user:) }

  describe '#call' do
    context 'when seat numbers are empty' do
      let(:seat_numbers) { [] }

      it 'returns false' do
        expect(create_reservation).to be(false)
      end

      it 'does not create a reservation' do
        expect { create_reservation }.not_to(change(Reservation, :count))
      end

      it 'adds an error' do
        create_reservation
        expect(reservation.errors[:base]).to include('You need to pick at least one seat')
      end
    end

    shared_examples 'invalid seat number' do |seat_number|
      let(:seat_numbers) { [seat_number] }

      it 'returns false' do
        expect(create_reservation).to be(false)
      end

      it 'does not create a reservation' do
        expect { create_reservation }.not_to(change(Reservation, :count))
      end

      it 'adds an error' do
        create_reservation
        expect(reservation.errors[:base]).to include('One of provided seats is invalid')
      end
    end

    context 'when seat number is less than 1' do
      include_examples 'invalid seat number', '0'
    end

    context 'when seat number is greater than hall capacity' do
      include_examples 'invalid seat number', '3'
    end

    context 'when seat number is not a number' do
      include_examples 'invalid seat number', 'A'
    end

    context 'when seat number is taken' do
      before do
        create(:reservation, show:, user:)
        create(:ticket, reservation:, seat_number: 1)
      end

      let(:seat_numbers) { ['1'] }

      it 'returns false' do
        expect(create_reservation).to be(false)
      end

      it 'does not create a reservation' do
        expect { create_reservation }.not_to(change(Reservation, :count))
      end

      it 'adds an error' do
        create_reservation
        expect(reservation.errors[:base]).to include('One of provided seats is already taken')
      end
    end

    context 'when every seat is taken' do
      before do
        create(:reservation, show:, user:)
        create(:ticket, reservation:, seat_number: 1)
        create(:ticket, reservation:, seat_number: 2)
      end

      let(:seat_numbers) { %w[1 2] }

      it 'returns false' do
        expect(create_reservation).to be(false)
      end

      it 'does not create a reservation' do
        expect { create_reservation }.not_to(change(Reservation, :count))
      end

      it 'adds an error' do
        create_reservation
        expect(reservation.errors[:base]).to include('Sorry, no seats are available for this show')
      end
    end

    context 'when seat numbers are valid and available' do
      let(:seat_numbers) { %w[1 2] }

      it 'returns true' do
        expect(create_reservation).to be(true)
      end

      it 'creates a reservation' do
        expect { create_reservation }.to change(Reservation, :count).by(1)
      end

      it 'creates 2 tickets' do
        expect { create_reservation }.to change(Ticket, :count).by(2)
      end
    end
  end
end
