class Enigma
  attr_reader :chars

  def initialize
    @chars = ("a".."z").to_a << " "
  end

  def encrypt(string, key = @key_base, date_string = @date_string)
    string.chars.map do |char|
      if @chars.include?(char)
        @chars.rotate(index_of(char))[shift]
      end
    end.join

    # crypt_out = encryptor
    # h[:encryption] = crypt_out
    # h[:key]        = key ## or key_base
    # h[:date]       = date_string
  end

  def index_of(char)
    @chars.index(char)
  end

  def scrub_shift(shift)
    shift % 27
  end
end
