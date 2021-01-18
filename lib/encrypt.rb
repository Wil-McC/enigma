require_relative './enigma'

enigma = Enigma.new

# message = File.open(ARGV[0], 'r')
# message_string = message.read

# or

message_string = File.read(ARGV[0])
output_hash = enigma.encrypt(message_string)

output_file = File.open(ARGV[1], 'w')
output_file.write(output_hash[:encrypted])
output_file.close
