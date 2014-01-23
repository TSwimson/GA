class MoviecController < ApplicationController
    def requestt(search)
      response = Typhoeus.post("http://www.omdbapi.com/", :params => {:s => search})
      result = JSON.parse(response.body)["Search"]
      movies = []
      result.each { |m|  Moviem.create({title: m["Title"], description: m['Plot'],imdbId: m["imdbID"]}) }
    end

    def index
        @movies = Moviem.all            
    end

    def new
      
    end

    def delete_all
      Moviem.all.each {|m| m.destroy }
      redirect_to '/moviec'
    end

    def show
        @movie = Moviem.find(params[:id])
    end

    def edit
        @movie = Moviem.find(params[:id])
    end

    def create
      movie = params.require(:moviec).permit(:title, :description)
      new_movie= Moviem.create(movie)
      redirect_to "/moviec/#{new_movie.id}"
    end

    def update
      movie_id = params[:id]
      movie = Moviem.find(movie_id)

      # get updated data
      updated_attributes = params.require(:movie).permit(:title, :description, :imdbId)
      # update the movie
      movie.update_attributes(updated_attributes)

      #redirect to show
      redirect_to "/moviec/#{movie_id}"
    end

    def destroy
      movie_id = params[:id]
      Moviem.destroy(movie_id)
      redirect_to "/moviec"
    end

    def search
      requestt(params["search"])
      redirect_to '/moviec'
    end
end
