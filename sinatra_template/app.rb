require 'sinatra'
require 'sinatra/reloader'
#require 'typhoeus'
#require 'json'
#require 'pry'

get '/' do
    erb :index
end