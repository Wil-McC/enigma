class ShiftCalculator

  attr_reader :nums

  def initialize
    @nums = ('0'..'9').to_a
    @key_base = key_gen
  end

  def get_offset_number
    Time.now.strftime('%d%m%Y').slice(0..3)
  end

  def key_gen
    key_str = ""
    5.times do
      key_str += @nums.sample
    end
    key_str
  end


  # a shift = key_base[0..1]
  # b shift
  # c shift
  # d shift


end
