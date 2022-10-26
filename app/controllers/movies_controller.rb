# frozen_string_literal: true

class MoviesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    @movies = authorize Movie.all
  end

  def show
    authorize find_movie
  end

  def new
    @movie = authorize Movie.new
  end

  def create
    @movie = authorize Movie.new
    result = MovieContract.new.call(params[:movie].to_unsafe_h)
    @movie.attributes = result.to_h

    if result.success?
      @movie.save
      redirect_to @movie
    else
      @errors = result.errors(full: true)
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize find_movie
  end

  def update
    authorize find_movie
    result = MovieContract.new.call(params[:movie].to_unsafe_h)
    @movie.attributes = result.to_h

    if result.success?
      @movie.save
      redirect_to @movie
    else
      @errors = result.errors(full: true)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize find_movie

    @movie.destroy

    redirect_to movies_path, status: :see_other
  end

  private

  def find_movie
    @movie = Movie.find(params[:id])
  end
end
