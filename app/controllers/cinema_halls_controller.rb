class CinemaHallsController < ApplicationController
  def index
    @cinema_halls = CinemaHall.all
  end

  def show
    @cinema_hall = CinemaHall.find(params[:id])
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
    @cinema_hall = CinemaHall.find(params[:id])
  end

  def update
    @cinema_hall = CinemaHall.find(params[:id])

    if @cinema_hall.update(cinema_hall_params)
      redirect_to @cinema_hall
    else 
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @cinema_hall = CinemaHall.find(params[:id])
    @cinema_hall.destroy

    redirect_to cinema_halls_path, status: :see_other
  end

  private

  def cinema_hall_params
    params.require(:cinema_hall).permit(:name, :capacity)
  end
end
