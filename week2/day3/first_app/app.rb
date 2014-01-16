require "sinatra"
require "sinatra/reloader"

get "/add/:a/:b" do
    (params[:a].to_i + params[:b].to_i).to_s
end

get "/subtract/:a/:b" do
    (params[:a].to_i - params[:b].to_i).to_s
end

get "/multiply/:a.:a1/:b.:b1" do
    a = params[:a].to_f + params[:a1].to_f/10.0
    b = params[:b].to_f + params[:b1].to_f/10.0
    (a + b).to_s
end

get "/multiply/:a/:b.:b1" do
    ((params[:a].to_f) * (params[:b].to_f + params[:b1].to_f/10.0)).to_s
end

get "/multiply/:a/:b" do
    (params[:a].to_i * params[:b].to_i).to_s
end

get "/divide/:a/:b" do
    if params[:b].to_i == 0
        "Cannot divide by zero"
    else
        (params[:a].to_i / params[:b].to_i).to_s
    end
end

get "/add/*/*" do
    params[:splat].inject(0) { |sum, x| sum + x.to_i }.to_s
end