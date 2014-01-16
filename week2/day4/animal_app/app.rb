require 'sinatra'
require 'sinatra/reloader'
require 'typhoeus'
require 'json'
require 'pry'
MY_DB = [{:species => "dog", :description => "is a dog"}]
#create animals
post "/animals" do

  MY_DB << params[:animal]
  redirect "/animal/#{MY_DB.size - 1}"

end

get "/" do
  @animals = MY_DB
  erb :index
end

#gets animal by id
get "/animal/:id" do 

  @animal = MY_DB[params[:id].to_i]
  @animal_id = params[:id].to_i
  erb :show

end

post "/delete/:id" do

  MY_DB.delete_at(params[:id].to_i)
  redirect "/"

end
# get "/animal/name/:name" do

#   tmp = MY_DB.select{ |x| x[:species].to_s == params[:name]}
#   tmp.inject { |sum, x| "x[:species] - x[:description]" }

# end
# end
# get "/"  do
#     #send_file "views/index.html"
#     @show_greeting = true
#     @greeting = params[:greeting]
#     erb :index
# end
