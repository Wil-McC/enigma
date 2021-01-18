require_relative './enigma'

enigma = Enigma.new

message_string = File.read(ARGV[0])
output_hash = enigma.encrypt(message_string)

File.write(ARGV[1], output_hash[:encryption])

puts "Created #{ARGV[1]} with the key #{output_hash[:key]} and date #{output_hash[:date]}"
