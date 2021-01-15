require_relative 'test_helper'

class ShiftCalculatorTest < Minitest::Test

  def setup
    @sc = ShiftCalculator.new
  end

  def test_it_exists_with_attributes
    assert_instance_of ShiftCalculator, @sc
  end

  def test_it_has_nums
    assert_equal ('0'..'9').to_a, @sc.nums
    assert_equal 10, @sc.nums.length
  end

  def test_key_gen
    assert_equal String, @sc.key_gen.class
  end

  def test_it_gets_valid_offset_string
    assert_equal 5, @sc.offset_number.length
  end
end
