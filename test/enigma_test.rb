require_relative 'test_helper'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
    require "pry"; binding.pry
  end

  def test_it_exists_with_attributes
    assert_instance_of Enigma, @enigma
  end

  def test_it_has_char_array
    char_array = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal char_array, @enigma.chars
    assert_equal 27, @enigma.chars.length
  end
end
