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

  # test for cases

  # test for en and de without key/date

  def test_typed_offset
    # stub generator offset number?
    skip
    assert_equal 4, @shifter.typed_offset('a', '040895')
    assert_equal 3, @shifter.typed_offset('b', '040895')
    assert_equal 2, @shifter.typed_offset('c', '040895')
    assert_equal 1, @shifter.typed_offset('d', '040895')
  end

  def test_key_range_gets_valid_values
    assert_equal 02, @shifter.key_range('a', '02715')
    assert_equal 27, @shifter.key_range('b', '02715')
    assert_equal 71, @shifter.key_range('c', '02715')
    assert_equal 15, @shifter.key_range('d', '02715')
  end
end
