# frozen_string_literal: true

class MoviesController < ApplicationController
  before_action :find_movie, only: %i[show edit update destroy]

  def index
    @movies = Movie.all
  end

  def show; end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to @movie
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @movie.update(movie_params)
      redirect_to @movie
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @movie.destroy

    redirect_to movies_path, status: :see_other
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :length_in_minutes)
  end

  def find_movie
    @movie = Movie.find(params[:id])
  end
end
