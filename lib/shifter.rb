require_relative './generator'

class Shifter
  include Generator

  def initialize(key, date)
    @key  = key
    @date = date
    @shifts_by_type = shift_builder(@key, @date)
  end
  
  def encrypt(string)
    counter = 0
    output = string.chars.map do |char|
      down_char = char.downcase
      counter += 1
      if char_array.include?(down_char)
        if counter % 4 == 1
          char_array.rotate(index_of(down_char))[scrub_shift(@shifts_by_type[:a])]
        elsif counter % 4 == 2
          char_array.rotate(index_of(down_char))[scrub_shift(@shifts_by_type[:b])]
        elsif counter % 4 == 3
          char_array.rotate(index_of(down_char))[scrub_shift(@shifts_by_type[:c])]
        elsif counter % 4 == 0
          char_array.rotate(index_of(down_char))[scrub_shift(@shifts_by_type[:d])]
        end
      else
        char
      end
    end.join
    output_info(output, 0)
  end

  def decrypt(string)
    counter = 0
    output = string.chars.map do |char|
      down_char = char.downcase
      counter += 1
      if char_array.include?(down_char)
        if counter % 4 == 1
          char_array.rotate(index_of(down_char))[-scrub_shift(@shifts_by_type[:a])]
        elsif counter % 4 == 2
          char_array.rotate(index_of(down_char))[-scrub_shift(@shifts_by_type[:b])]
        elsif counter % 4 == 3
          char_array.rotate(index_of(down_char))[-scrub_shift(@shifts_by_type[:c])]
        elsif counter % 4 == 0
          char_array.rotate(index_of(down_char))[-scrub_shift(@shifts_by_type[:d])]
        end
      else
        char
      end
    end.join
    output_info(output, 1)
  end

  def shift_builder(key, date_str)
    shift_types = ('a'..'d').to_a
    shift_types.each_with_object({}) do |type, hash|
      hash[type.to_sym] = shift(type, key, date_str)
    end
  end

  def shift(type, key, date_str)
    key_range(type, key) + typed_offset(type, date_str)
  end

  def key_range(type, key)
    key[(type.ord - 97)..(type.ord - 96)].to_i
  end

  def typed_offset(type, date_str)
    offset_number(date_str)[type.ord - 97].to_i
  end

  def output_info(output, direction)
    if direction == 0
      {
        encryption: output,
        key: @key,
        date: @date
      }
    elsif direction == 1
      {
        decryption: output,
        key: @key,
        date: @date
      }
    end
  end

  def index_of(char)
    char_array.index(char)
  end

  def scrub_shift(shift_val)
    shift_val % 27
  end
end
