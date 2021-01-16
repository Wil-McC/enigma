class ShiftCalculator

  attr_reader :nums

  def initialize
    @nums = ('0'..'9').to_a
    @valid_types = ['a', 'b', 'c', 'd']
    @key_base = key_gen
  end

  def offset_number(time = Time.now)
    time_square = (time.strftime('%d%m%Y').to_i) ** 2
    time_square.to_s.slice(-4..-1)
  end

  def key_gen
    key_str = ""
    5.times do
      key_str += @nums.sample
    end
    key_str
  end

  # doesn't store one value throughout
  # def key_base
    # key_gen
  # end
  # could use a third method to hold instance attr key_key = @key_base, stub key key

  def shift(type)
    key_range(type) + offset_number[type.ord - 97].to_i
  end

  # needs tests
  def key_range(type)
    @key_base[(type.ord - 97)..(type.ord - 96)].to_i
  end
end
