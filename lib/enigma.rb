class Enigma
  attr_reader :chars

  def initialize
    @chars = ("a".."z").to_a << " "
  end

  def encrypt(string, key, date)
    string.chars.map do |char|

    end.join('') # ???? flatten?
  end

  def scrub_shift(shift)
    shift % 27
  end

end
