require_relative './generator'
require_relative './shifter'

class Enigma
  include Generator

  def encrypt(string, key = key_gen, date_string = date_string)
    shifter = Shifter.new(key, date_string)
    shifter.encrypt(string)
  end
end
