require "sinatra"
require "sinatra/reloader"

get "/add/:a/:b" do
    (params[:a].to_i + params[:b].to_i).to_s
end

get "/subtract/:a/:b" do
    (params[:a].to_i - params[:b].to_i).to_s
end

get "/multiply/:a.*/:b.*" do
    ((params[:a].to_f + params[:splat][0].to_f/10.0) * (params[:b].to_f + params[:splat][1].to_f/10.0)).to_s
end

get "/multiply/:a/:b.*" do
    ((params[:a].to_f) * (params[:b].to_f + params[:splat][1].to_f/10.0)).to_s
end

get "/multiply/:a/:b" do
    (params[:a].to_i * params[:b].to_i).to_s
end

get "/divide/:a/:b" do
    (params[:a].to_i / params[:b].to_i).to_s if params[:b].to_i > 0
end

get "/add/*/*" do
    params[:splat].inject(0) { |sum, x| sum + x.to_i }.to_s
end


