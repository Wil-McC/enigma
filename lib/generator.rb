require 'Time'

module Generator

  def offset_number(date_string)
    date_square = date_string.to_i ** 2
    date_square.to_s.slice(-4..-1)
  end

  def today_date_string
    Time.now.strftime('%d%m%y')
  end

  def key_gen
    key_str = ""
    5.times do
      key_str += num_array.sample
    end
    key_str
  end

  def num_array
    ('0'..'9').to_a
  end

  def char_array
    ("a".."z").to_a << " "
  end
end
