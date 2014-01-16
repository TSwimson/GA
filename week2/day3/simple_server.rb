require "webrick"
#get the path for the server 
root = File.expand_path(".")
#create new instance of webrick server and pass it the port and doc root
server = WEBrick::HTTPServer.new :Port => 8000, :DocumentRoot => root

server.mount_proc "/hello" do |req, res|
    res.body = "Hello, world!"
end

trap "INT" do
    server.shutdown
end

server.start

