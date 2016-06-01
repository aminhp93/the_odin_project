# require 'socket'      # Sockets are in standard library

# hostname = 'localhost'
# port = 2000

# s = TCPSocket.open(hostname, port)

# while line = s.gets   # Read lines from the socket
#   puts line.chop      # And print with platform line terminator
# end
# s.close               # Close the socket when done

require 'socket'

hostname = 'localhost'
port = 2000

s = TCPSocket.open(hostname, port)

s.puts "GET index.html HTTP/1.0"
while line = s.gets
  puts line.chop
end
s.close