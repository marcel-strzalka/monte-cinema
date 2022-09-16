class HallsController < ApplicationController
  before_action :find_hall, only: %i[ show edit update destroy ]

  def index
    @halls = Hall.all
  end

  def show
  end

  def new
    @hall = Hall.new
  end

  def create
    @hall = Hall.new(hall_params)

    if @hall.save
      redirect_to @hall
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @hall.update(hall_params)
      redirect_to @hall
    else 
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @hall.destroy

    redirect_to halls_path, status: :see_other
  end

  private

  def hall_params
    params.require(:hall).permit(:name, :capacity)
  end

  def find_hall
    @hall = Hall.find(params[:id])
  end
end
