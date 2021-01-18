module Shiftable

  def offset_number(date_string)
    date_square = date_string.to_i ** 2
    date_square.to_s.slice(-4..-1)
  end

  def today_date_string
    Time.now.strftime('%d%m%Y')
  end

  def key_gen
    key_str = ""
    5.times do
      key_str += @num_array.sample
    end
    key_str
  end
  # module above

  # Shift class
  #scrub shifts in builder
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

  # cryptor
end
