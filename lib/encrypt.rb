require_relative './enigma'

enigma = Enigma.new

message = File.open(ARGV[0], 'r')

output_file = File.open(ARGV[1], 'w')
output_file.write(crypted_text)
output_file.close
