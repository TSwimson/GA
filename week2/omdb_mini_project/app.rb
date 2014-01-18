require 'sinatra'
require 'sinatra/reloader'
require 'typhoeus'
require 'json'
require "pry"
class Movie

    attr_reader :title, :year, :id, :ad

    def initialize title, year, id
        @title = title
        @year = year
        @id = id
        @ad = nil
    end

    def get_additional_content
        response = Typhoeus.get("http://www.omdbapi.com/", :params => {:i => @id})
        result = JSON.parse(response.body)
        @ad = result.select{|k,v| %w(Plot Rated Runtime Genre Director Actors Poster Metascore Type).include? k}
        @ad["Poster"] = "/img/nopicture.gif" if @ad["Poster"].size < 5
    end
end

def get_movies search
    response = Typhoeus.get("http://www.omdbapi.com/", :params => {:s => params[:splat][0]})
    result = JSON.parse(response.body)["Search"]
    movies = {}
    result.each { |m| movies[m["imdbID"]] = Movie.new(m["Title"], m["Year"], m["imdbID"]) }
    movies.each_value { |v| v.get_additional_content }
    movies.reject! { |k,v| v.ad["Type"].downcase != "movie" }
end

get '/*' do
    if params[:splat][0].size > 0
        @movies = get_movies params[:splat][0]
    end
    erb :index
end

post "/" do
    redirect "/#{params[:s]}"
end