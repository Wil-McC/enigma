require_relative './enigma'

enigma = Enigma.new
require "pry"; binding.pry

message_string = File.read('./lib/' + ARGV[0])
output_hash = enigma.encrypt(message_string)

# output_file = File.open(ARGV[1], 'w')
File.write(ARGV[1], output_hash[:encryption])
# output_file.close

puts "Created #{ARGV[1]} with the key #{output_hash[:key]} and date #{output_hash[:date]}"
