require 'Time'

class Enigma
  attr_reader :chars,

  def initialize
    @chars = ("a".."z").to_a << " "
  end

end
