# frozen_string_literal: true

class ShowsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    authorize Show
    @movies = Movie.all
    @reservations = Reservation.relevant_for(current_user) if current_user&.customer?
  end

  def show
    authorize find_show
  end

  def new
    @show = authorize Show.new
  end

  def create
    @show = authorize Show.new(show_params)

    if @show.valid? && TimePeriodDoesntOverlap.validate(@show)
      @show.save
      redirect_to @show
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    authorize find_show

    @show.destroy

    redirect_to shows_path, status: :see_other
  end

  private

  def show_params
    params.require(:show).permit(:hall_id, :movie_id, :start_time)
  end

  def find_show
    @show = Show.find(params[:id])
  end
end
