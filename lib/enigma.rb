class Enigma
  attr_reader :chars

  def initialize
    @chars = ("a".."z").to_a << " "
  end

  def encrypt(string, key = @sc.key_base, date )
    string.chars.map do |char|
      if @chars.include?(char)
        @chars.rotate(index_of(char))[shift]
      end
    end.join
  end

  def index_of(char)
    @chars.index(char)
  end

  def scrub_shift(shift)
    shift % 27
  end

end
