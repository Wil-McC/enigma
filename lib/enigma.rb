require_relative './generator'
require_relative './shifter'

class Enigma
  include Generator

  def encrypt(string, key = key_gen, date_string = today_date_string)
    shifter = Shifter.new(key, date_string)
    shifter.encrypt(string)
  end

  def decrypt(string, key, date_string = today_date_string)
    shifter = Shifter.new(key, date_string)
    shifter.decrypt(string)
  end
end
