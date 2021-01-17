require_relative 'test_helper'

class ShifterTest < Minitest::Test

  def setup
    @shifter = Shifter.new('02715','040895')
  end

  def test_it_exists_with_attributes
    assert_instance_of Shifter, @shifter
  end

  def test_it_encrypts
    expected = {
      encryption: 'keder ohulw',
      key: '02715',
      date: '040895'
    }
    assert_equal expected, @shifter.encrypt('hello world')
  end

  def test_it_encrypts_uppercases
    expected = {
      encryption: 'keder ohulw',
      key: '02715',
      date: '040895'
    }
    assert_equal expected, @shifter.encrypt('Hello World')
    assert_equal expected, @shifter.encrypt('HELLO WORLD')
  end
end
