require 'webrick'

#FileHandler servlet provides the option to choose which files from user to serve
#The following code shows how to serve them from the folder 'myapp'
root = File.expand_path '/var/myapp/'

#Instantiating a new server with HTTPServer.new on port 1234 serving the documents from root folder
server = WEBrick::HTTPServer.new :Port => 1234, :DocumentRoot => root

#The following proc is used to customize the server operations
server.mount_proc '/' do |request, response|
  response.body = 'Hello, world!'
end

#The following command will provide a hook to shutdown the server (often done with Ctrl+C)
trap('INT') {server.shutdown}

#Start the server
server.start
