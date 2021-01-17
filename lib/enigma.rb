require_relative './shiftable'

class Enigma
  include Shiftable

  attr_reader :char_array,
              :shifts_by_type

  def initialize
    @char_array       = ("a".."z").to_a << " "
    @num_array        = ('0'..'9').to_a
    @key_base         = key_gen
    @date_string      = today_date_string
    @shifts_by_type   = nil                 # leave in methods?
  end

  def encrypt(string, key = @key_base, date_string = @date_string)
    @shifts_by_type = shift_builder(key, date_string)

    counter = 0
    en_out = string.chars.map do |char|
      counter += 1
      if @char_array.include?(char)
        if counter % 4 == 1
          @char_array.rotate(index_of(char))[scrub_shift(@shifts_by_type[:a])]
        elsif counter % 4 == 2
          @char_array.rotate(index_of(char))[scrub_shift(@shifts_by_type[:b])]
        elsif counter % 4 == 3
          @char_array.rotate(index_of(char))[scrub_shift(@shifts_by_type[:c])]
        elsif counter % 4 == 0
          @char_array.rotate(index_of(char))[scrub_shift(@shifts_by_type[:d])]
        end
      else
        char
      end
    end.join

    en_hash = Hash.new
    en_hash[:encryption] = en_out
    en_hash[:key]        = key
    en_hash[:date]       = date_string
    en_hash
  end

  def index_of(char)
    @char_array.index(char)
  end

  def scrub_shift(shift_val)
    shift_val % 27
  end
end
