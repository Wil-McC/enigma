class Enigma
  attr_reader :chars,
              :nums

  def initialize
    @chars = ("a".."z").to_a << " "
    @nums  = (0..9).to_a
  end

end
