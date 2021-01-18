require_relative './shiftable'

class Encryptor
  include Shiftable

  def initialize
    @char_array       = ("a".."z").to_a << " "
    @num_array        = ('0'..'9').to_a
    # @key_base         = key_gen
    # @date_string      = today_date_string
    @shifts_by_type   = nil
  end

  def encrypt_text(string, key, date_string)
    @shifts_by_type = shift_builder(key, date_string)

    counter = 0
    en_out = string.chars.map do |char|
      down_char = char.downcase
      counter += 1
      if @char_array.include?(down_char)
        if counter % 4 == 1
          @char_array.rotate(index_of(down_char))[scrub_shift(@shifts_by_type[:a])]
        elsif counter % 4 == 2
          @char_array.rotate(index_of(down_char))[scrub_shift(@shifts_by_type[:b])]
        elsif counter % 4 == 3
          @char_array.rotate(index_of(down_char))[scrub_shift(@shifts_by_type[:c])]
        elsif counter % 4 == 0
          @char_array.rotate(index_of(down_char))[scrub_shift(@shifts_by_type[:d])]
        end
      else
        char
      end
    end.join

    encrypt_output(en_out, key, date_string)
  end

  def encrypt_output(en_out, key, date_string)
    encryption_hash = Hash.new
    encryption_hash[:encryption] = en_out
    encryption_hash[:key]        = key
    encryption_hash[:date]       = date_string
  end


end
