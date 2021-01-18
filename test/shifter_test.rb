require_relative 'test_helper'

class ShifterTest < Minitest::Test

  def setup
    @shifter = Shifter.new('02715','040895')
  end

  def test_it_exists
    assert_instance_of Shifter, @shifter
  end

  def test_shift_builder
    expected = {
      a: 3,
      b: 27,
      c: 73,
      d: 20
    }

    assert_equal expected, @shifter.shift_builder('02715', '040895')
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
end
