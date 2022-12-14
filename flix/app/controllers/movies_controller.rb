class MoviesController < ApplicationController
  def index
    @movies = Movie.released
  end

  def show
    @movie = find_movie_by_id_param
  end

  def edit
    @movie = find_movie_by_id_param
  end

  def update
    @movie = find_movie_by_id_param
    @movie.update(movie_params)
    redirect_to @movie
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.save
    redirect_to @movie
  end

  def destroy
    @movie = find_movie_by_id_param
    @movie.destroy
    redirect_to movies_url, status: :see_other
  end

  private

  def find_movie_by_id_param
    Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie)
          .permit(:title, :description, :rating,
                  :released_on, :total_gross, :director,
                  :duration, :image_file_name)
  end
end
