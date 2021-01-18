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

  def test_it_decrypts
    expected = {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, @shifter.decrypt('keder ohulw')
  end

  # Module tests
  def test_it_gets_valid_offset_string
    assert_equal 4, @shifter.offset_number('040895').length
    assert_equal String, @shifter.offset_number('040895').class
  end

  def test_date_string
    assert_equal String, @shifter.today_date_string.class
    assert_equal 8, @shifter.today_date_string.length
    # stub time to test
  end
end
