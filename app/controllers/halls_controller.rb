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
    @hall = authorize Hall.new
    result = HallContract.new(hall: @hall).call(params[:hall].to_unsafe_h)
    @hall.attributes = result.to_h

    if result.success?
      @hall.save
      redirect_to @hall
    else
      @errors = result.errors(full: true)
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize find_hall
  end

  def update
    authorize find_hall
    result = HallContract.new(hall: @hall).call(params[:hall].to_unsafe_h)
    @hall.attributes = result.to_h

    if result.success?
      @hall.save
      redirect_to @hall
    else
      @errors = result.errors(full: true)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize find_hall

    @hall.destroy

    redirect_to halls_path, status: :see_other
  end

  private

  def find_hall
    @hall = Hall.find(params[:id])
  end
end
