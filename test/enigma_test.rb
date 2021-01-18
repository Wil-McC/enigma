require_relative 'test_helper'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists_with_attributes
    assert_instance_of Enigma, @enigma
  end

  def test_it_encrypts
    expected = {
      encryption: 'keder ohulw',
      key: '02715',
      date: '040895'
    }
    assert_equal expected, @enigma.encrypt('hello world','02715','040895')
  end

  def test_it_encrypts_uppercases
    expected = {
      encryption: 'keder ohulw',
      key: '02715',
      date: '040895'
    }
    assert_equal expected, @enigma.encrypt('Hello World','02715','040895')
    assert_equal expected, @enigma.encrypt('HELLO WORLD','02715','040895')
  end

  def test_it_passes_over_unknown_characters
    expected = {
      encryption: 'keder ohulw!',
      key: '02715',
      date: '040895'
    }
    assert_equal expected, @enigma.encrypt('hello world!','02715','040895')
  end
end
