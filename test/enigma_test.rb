require_relative 'test_helper'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  # move attributes here?
  def test_it_exists_with_attributes
    assert_instance_of Enigma, @enigma
  end

  def test_it_has_char_array
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal expected, @enigma.char_array
    assert_equal 27, @enigma.char_array.length
  end

  def test_it_encrypts
    assert_equal 'meep', @enigma.encrypt('hype')
  end

  def test_shift_builder
    skip
  end
end
