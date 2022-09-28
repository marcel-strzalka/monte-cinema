# frozen_string_literal: true

class ReservationsController < ApplicationController
  before_action do
    redirect_to shows_path unless current_user
  end

  def show
    @reservation = find_reservation
  end

  def new
    show = Show.find(params[:show_id])
    @reservation = Reservation.new(show:, user: current_user)
    @seats = ShowAllSeats.new(show:).call
  end

  def create
    show = Show.find(params[:show_id])
    @reservation = Reservation.new(show:, user: current_user)

    if CreateReservation.new(reservation: @reservation, seat_numbers: params[:seat_numbers]).call
      redirect_to show_reservation_path(show_id: show.id, id: @reservation.id)
    else
      @seats = ShowAllSeats.new(show:).call
      render :new, status: :unprocessable_entity
    end
  end

  def cancel
    reservation = find_reservation
    CancelReservation.new(reservation:).call

    path = show_reservation_path(show_id: reservation.show, id: reservation.id)
    redirect_to path, notice: 'Your reservation has been cancelled.'
  end

  def confirm
    reservation = find_reservation
    ConfirmReservation.new(reservation:).call

    path = show_reservation_path(show_id: reservation.show, id: reservation.id)
    redirect_to path, notice: 'Your reservation has been confirmed.'
  end

  private

  def find_reservation
    return Reservation.find(params[:id]) if manager?

    Reservation.find_by(user: current_user, id: params[:id])
  end
end
