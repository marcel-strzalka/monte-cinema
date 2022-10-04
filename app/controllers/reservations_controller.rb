# frozen_string_literal: true

class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @show = Show.find(params[:show_id])
    @reservations = authorize policy_scope(Reservation).for(@show)
  end

  def show
    @reservation = authorize policy_scope(Reservation).find(params[:id])
  end

  def new
    show = Show.find(params[:show_id])
    @reservation = authorize Reservation.new(show:, user: current_user)
    @seats = GetAllSeats.new(show:).call
  end

  def create
    show = Show.find(params[:show_id])
    @reservation = authorize Reservation.new(show:, user: current_user)

    if CreateReservation.new(reservation: @reservation, seat_numbers: params[:seat_numbers]).call
      redirect_to show_reservation_path(show_id: show.id, id: @reservation.id)
    else
      @seats = GetAllSeats.new(show:).call
      render :new, status: :unprocessable_entity
    end
  end

  def cancel
    reservation = authorize policy_scope(Reservation).find(params[:id])
    CancelReservation.new(reservation:).call

    path = show_reservation_path(show_id: reservation.show, id: reservation.id)
    redirect_to path, notice: 'Your reservation has been cancelled.'
  end

  def confirm
    reservation = authorize policy_scope(Reservation).find(params[:id])
    ConfirmReservation.new(reservation:).call

    path = show_reservation_path(show_id: reservation.show, id: reservation.id)
    redirect_to path, notice: 'Your reservation has been confirmed.'
  end
end
