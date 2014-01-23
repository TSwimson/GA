class MoviesController < ApplicationController

    def index
        @movies = Moviem.all            
    end

    def new
      
    end

    def show
        @movie = Moviem.find(params[:id])
    end

    def edit
        @movie = Moviem.find(params[:id])
    end

    def create
      movie = params.require(:moviem).permit(:name,:description, :imdbId)
      new_movie= Moviem.create(movie)
      redirect_to "/movies/#{new_movie.id}"
    end

    def update
      movie_id = params[:id]
      movie = Moviem.find(movie_id)

      # get updated data
      updated_attributes = params.require(:movie).permit(:name, :description, :imdbId)
      # update the movie
      movie.update_attributes(updated_attributes)

      #redirect to show
      redirect_to "/movies/#{movie_id}"
    end

    def delete
      movie_id = params[:id]
      Moviem.destroy(movie_id)
      redirect_to "/movies"
    end
end
