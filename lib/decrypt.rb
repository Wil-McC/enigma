require_relative './enigma'

enigma = Enigma.new

encrypted_string = File.read(ARGV[0])
output_hash = enigma.decrypt(encrypted_string, ARGV[2], ARGV[3])

File.write(ARGV[1], output_hash[:decryption])

puts "Created #{ARGV[1]} with the key #{output_hash[:key]} and date #{output_hash[:date]}"
