require 'socket'
require 'json'             

server = TCPServer.open(2000)  
loop {
  Thread.start(server.accept) do |client|
    # this is short-term fix for reading request from client.  Need to research best solution.                     
    request = client.read_nonblock(256)

    request_header, request_body = request.split("\r\n\r\n", 2)   # splits request into header and body
    path = request_header.split[1][1..-1]                         # gets path from request header
    method = request_header.split[0]                              # gets method: GET or POST

    if File.exists?(path)                                  
      response_body = File.read(path)
      client.puts "HTTP/1.1 200 OK\r\nContent-type:text/html\r\n\r\n"
      if method == 'GET'
        client.puts response_body
      elsif method == 'POST'
        params = {}
        params = JSON.parse(request_body)
        client.puts response_body.gsub("<%= yield %>", "<li>#{params['person']['name']}</li><li>#{params['person']['email']}</li>")
      end
    else
      client.puts "HTTP/1.1 404 Not Found\r\n\r\n"
      client.puts "404 Error, File Could not be Found"
    end 
    client.close
  end

}
