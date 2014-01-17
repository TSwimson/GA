require 'sinatra'
require 'sinatra/reloader'
require 'typhoeus'
require 'json'

get '/' do

    erb :index
end

post "/" do
    
    redirect "/"
end