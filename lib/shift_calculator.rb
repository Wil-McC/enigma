class ShiftCalculator

  attr_reader :nums

  def initialize
    @nums = ('0'..'9').to_a
    @valid_types = ['a', 'b', 'c', 'd']
    @key_base = key_gen
  end

  def offset_number(time = date_string)
    time_square = time.to_i ** 2
    time_square.to_s.slice(-4..-1)
  end

  def date_string
    Time.now.strftime('%d%m%Y')
  end

  def key_gen
    key_str = ""
    5.times do
      key_str += @nums.sample
    end
    key_str
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
