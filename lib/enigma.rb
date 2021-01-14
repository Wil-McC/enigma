require 'Time'

class Enigma
  attr_reader :chars,
              :nums

  def initialize
    @chars = ("a".."z").to_a << " "
    @nums  = ('0'..'9').to_a
  end

  def key_gen
    key_str = ""
    5.times do
      key_str += @nums.sample
    end
    key_str
  end

  # Refactor me I'm long and hideous
  def get_offset_number
    Time.now.strftime('%d%m%Y').slice(0..3)
  end

end
