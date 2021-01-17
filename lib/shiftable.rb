module Shiftable

  def offset_number(time = today_date_string)
    time_square = time.to_i ** 2
    time_square.to_s.slice(-4..-1)
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

  def shift_builder(key, date_str)
    shift_flavors = ('a'..'d').to_a
    shift_flavors.each_with_object({}) do |flavor, hash|
      hash[flavor] = shift(flavor, key, date_str)
    end
  end

  def shift(flavor, key, date_str)
    key_range(flavor, key) + typed_offset(flavor, date_str)
  end

  def key_range(flavor, key)
    key[(flavor.ord - 97)..(flavor.ord - 96)].to_i
  end

  def typed_offset(flavor, date_str)
    offset_number(date_str)[flavor.ord - 97].to_i
  end
end
