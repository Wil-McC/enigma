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

  # x_crypt method - take + or - and reuse methods?
  def encrypt(string, key = @key_base, date_string = @date_string)
    @shifts_by_flavor = shift_builder(key, date_string)
    shift_val = @shifts_by_flavor.values.sample # temp
    en_out = string.chars.map do |char|
      if @char_array.include?(char)
        @char_array.rotate(index_of(char))[scrub_shift(shift_val)]
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

  # for encrypt looping
  def add_me
    chars.each_slice(4) do |a, b, c, d|
      # if includes
      # shift a by h['a']
      # or
      # if includes
      # shift b by h[b.to_s]
    end
  end

  def index_of(char)
    @char_array.index(char)
  end

  def scrub_shift(shift_val)
    shift_val % 27
  end
end
