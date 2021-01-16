require_relative './shiftable'

class Enigma
  include Shiftable

  attr_reader :chars

  def initialize
    @char_array  = ("a".."z").to_a << " "
    @num_array   = ('0'..'9').to_a
    @key_base    = key_gen
    @date_string = today_date_string
  end

  def encrypt(string, key = @key_base, date_string = @date_string)
    string.chars.map do |char|
      if @char_array.include?(char)
        @char_array.rotate(index_of(char))[shift]
      end
    end.join

    # crypt_out = encryptor
    # h[:encryption] = crypt_out
    # h[:key]        = key ## or key_base
    # h[:date]       = date_string
  end

  def index_of(char)
    @chars.index(char)
  end

  def scrub_shift(shift)
    shift % 27
  end
end
