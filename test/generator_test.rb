require_relative 'test_helper'
require './lib/generator'

class GeneratorTest < Minitest::Test
  include Generator

  def test_today_date_string
    assert_equal String, today_date_string.class
    assert_equal 6, today_date_string.length
    new_date = DateTime.new(2022, 7, 7, 1, 1, 1)
    # not working
    Time.stubs(:now).returns(new_date)
    assert_equal '070722', today_date_string
  end

  def test_it_gets_valid_offset_number
    assert_equal 4, offset_number('040895').length
    assert_equal String, offset_number('040895').class
    assert_equal '1025', offset_number('040895')
  end

  def test_key_gen
    assert_equal String, key_gen.class
    assert_equal 5, key_gen.length
  end

  def test_it_has_num_array
    def test_it_has_nums
      assert_equal ('0'..'9').to_a, num_array
      assert_equal 10, num_array.length
    end
  end

  def test_it_has_char_array
    assert_equal ("a".."z").to_a << " ", char_array
    assert_equal 27, char_array.length
  end
end
