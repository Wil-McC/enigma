class ShiftCalculator

  attr_reader :nums

  def initialize
    @nums = ('0'..'9').to_a
    @key_base = key_gen
  end

  # move to initialize?
  def offset_number
    Time.now.strftime('%d%m%Y').slice(-4..-1)
  end

  def key_gen
    key_str = ""
    5.times do
      key_str += @nums.sample
    end
    key_str
  end

  # keep in initialize?
  # a shift = key_base[0..1] + offset_number[0]
  # b shift = key_base[1..2] + offset_number[1]
  # c shift = key_base[2..3] + offset_number[2]
  # d shift = key_base[3..4] + offset_number[3]


end
