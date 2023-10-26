require "socket"

class YourRedisServer
  MAXIMUM_DATA_RECEIVE = 4000
  def initialize(port)
    @port = port
  end

  def start
    server = TCPServer.new(@port)
    client = server.accept
    loop do
      client.recv(MAXIMUM_DATA_RECEIVE)
      client.puts response
    end
    client.close
  end

  private

  def response
    "+PONG\r\n"
  end
end

YourRedisServer.new(6379).start
