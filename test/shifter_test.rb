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
    @shifter.stubs(:offset_number).with('040895').returns('4321')

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

  # Generator module tests

  def test_today_date_string
    assert_equal String, @shifter.today_date_string.class
    assert_equal 6, @shifter.today_date_string.length
    new_date = DateTime.new(2022, 7, 7, 1, 1, 1)
    Time.stubs(:now).returns(new_date)
    assert_equal '070722', @shifter.today_date_string
  end

  def test_it_gets_valid_offset_number
    assert_equal 4, @shifter.offset_number('040895').length
    assert_equal String, @shifter.offset_number('040895').class
    assert_equal '1025', @shifter.offset_number('040895')
  end

  def test_key_gen
    assert_equal String, @shifter.key_gen.class
    assert_equal 5, @shifter.key_gen.length
  end

  def test_it_has_num_array
    def test_it_has_nums
      assert_equal ('0'..'9').to_a, @shifter.num_array
      assert_equal 10, @shifter.num_array.length
    end
  end

  def test_it_has_char_array
    assert_equal ("a".."z").to_a << " ", @shifter.char_array
    assert_equal 27, @shifter.char_array.length
  end
end
