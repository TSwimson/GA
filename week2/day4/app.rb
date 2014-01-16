require 'sinatra'
require 'sinatra/reloader'
require 'typhoeus'
require 'json'
require 'pry'
post "/animals" do

end

get "/" do
    erb :index
end



# get "/"  do
#     #send_file "views/index.html"
#     @show_greeting = true
#     @greeting = params[:greeting]
#     erb :index
# end


