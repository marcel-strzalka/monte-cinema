# frozen_string_literal: true

class HallsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    @halls = authorize Hall.all
  end

  def show
    authorize find_hall
  end

  def new
    @hall = authorize Hall.new
  end

  def create
    @hall = authorize Hall.new(hall_params)

    if @hall.save
      redirect_to @hall
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize find_hall
  end

  def update
    authorize find_hall

    if @hall.update(hall_params)
      redirect_to @hall
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize find_hall

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
