require_relative 'test_helper'
require './lib/generator'

class ShifterTest < Minitest::Test
  include Generator

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

  def test_typed_offset
    @shifter.stubs(:offset_number).returns('4321')

    assert_equal 4, @shifter.typed_offset('a', '040895')
    assert_equal 3, @shifter.typed_offset('b', '040895')
    assert_equal 2, @shifter.typed_offset('c', '040895')
    assert_equal 1, @shifter.typed_offset('d', '040895')
  end

  # Module tests - require module and get rid of shifter
  def test_it_gets_valid_offset_string
    assert_equal 4, offset_number('040895').length
    assert_equal String, offset_number('040895').class
  end

  def test_date_string
    assert_equal String, today_date_string.class
    assert_equal 8, today_date_string.length
  end

  def test_it_gets_valid_offset_string
    assert_equal 4, offset_number('040895').length
    assert_equal String, offset_number('040895').class
    assert_equal '1025', offset_number('040895')
  end

end
