class MoviesController < ApplicationController
  def index
    # Only wanted sample of 6
    # count = Movie.count
    # random_offset = rand(count)
    # Movie.offset(random_offset).first
    @movies = Movie.all.sample(5)
  end

  def show
    # pop up screen
    @movies = Movie.find(params[:id])
  end

  def update
    # move movie to saved folder
    # changes db to saved: true
  end

  def destroy
    # When you click a "x"
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to lists_path, status: :see_other
  end
end
