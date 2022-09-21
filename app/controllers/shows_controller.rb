# frozen_string_literal: true

class ShowsController < ApplicationController
  before_action except: %i[index show] do
    redirect_to movies_path unless manager?
  end
  before_action :find_show, only: %i[show destroy]

  def index
    @movies = Movie.all
  end

  def show; end

  def new
    @show = Show.new
  end

  def create
    @show = Show.new(show_params)

    if @show.valid? && @show.time_period_doesnt_overlap?
      @show.save
      redirect_to @show
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
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
