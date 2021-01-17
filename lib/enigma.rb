require_relative './shiftable'

class Enigma
  include Shiftable

  attr_reader :char_array

  def initialize
    @char_array       = ("a".."z").to_a << " "
    @num_array        = ('0'..'9').to_a
    @key_base         = key_gen
    @date_string      = today_date_string
    @shifts_by_flavor = nil                   # leave in methods?
  end

  def encrypt(string, key = @key_base, date_string = @date_string)
    @shifts_by_flavor = shift_builder(key, date_string)
    shift_val = @shifts_by_flavor['a'] # temp
    string.chars.map do |char|
      if @char_array.include?(char)
        @char_array.rotate(index_of(char))[scrub_shift(shift_val)]
      else
        char
      end
    end.join

    # crypt_out = line 19 map enum
    # h[:encryption] = crypt_out
    # h[:key]        = key ## or key_base
    # h[:date]       = date_string
  end

  def index_of(char)
    @char_array.index(char)
  end

  def scrub_shift(shift_val)
    shift_val % 27
  end
end
