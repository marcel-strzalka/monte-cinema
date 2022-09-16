class CinemaHallsController < ApplicationController
  before_action :find_cinema_hall, only: %i[ show edit update destroy ]

  def index
    @cinema_halls = CinemaHall.all
  end

  def show
  end

  def new
    @cinema_hall = CinemaHall.new
  end

  def create
    @cinema_hall = CinemaHall.new(cinema_hall_params)

    if @cinema_hall.save
      redirect_to @cinema_hall
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @cinema_hall.update(cinema_hall_params)
      redirect_to @cinema_hall
    else 
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @cinema_hall.destroy

    redirect_to cinema_halls_path, status: :see_other
  end

  private

  def cinema_hall_params
    params.require(:cinema_hall).permit(:name, :capacity)
  end

  def find_cinema_hall
    @cinema_hall = CinemaHall.find(params[:id])
  end
end
