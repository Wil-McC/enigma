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
    assert_equal 'keder ohulw', @enigma.encrypt('hello world','02715','040895')
  end

  def test_shift_builder
    @enigma.encrypt('hello world','02715','040895')
    expected = {
      a: 3,
      b: 27,
      c: 73,
      d: 20
    }
    assert_equal expected, @enigma.shifts_by_type
  end

  # get all tests from shift calc tests
end
