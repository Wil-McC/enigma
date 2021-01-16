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
      key_str += @nums.sample
    end
    key_str
  end

  def shift_builder(key, date)
    shift_flavors = ('a'..'d').to_a
    shift_flavors.each do |flavor|
      h[flavor] = shift(flavor)
    end
  end

  def shift(type)
    key_range(type) + typed_offset(type)
  end

  def key_range(type)
    key_base[(type.ord - 97)..(type.ord - 96)].to_i
  end

  def typed_offset(type)
    offset_number[type.ord - 97].to_i
  end
end
