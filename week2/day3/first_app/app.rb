require "sinatra"
require "sinatra/reloader"

MY_USERS = [{name: "Jon"}, {name: "Jane"}]

get "/users" do
    users = ""
    MY_USERS.each { |u| users += "#{u[:name]} </br>"}

    users
end

get "/users/:id" do
    "#{MY_USERS[params[:id].to_i][:name]}"
end

