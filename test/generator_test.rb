require_relative 'test_helper'
require './lib/generator'

class GeneratorTest < Minitest::Test
  include Generator

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
