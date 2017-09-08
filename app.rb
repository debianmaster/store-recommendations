require 'webrick'
json = File.read("./products.json")
class Server < WEBrick::HTTPServlet::AbstractServlet
  def initialize(server, json)
    super(server)
    @json = json
  end

  def do_GET(request, response)
    response.status = 200
    response['Content-Type'] = 'application/text'
    response.body = @json
  end
end

server = WEBrick::HTTPServer.new :Port => 8080
server.mount "/", Server, json

trap 'INT' do server.shutdown end
server.start
