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
    assert_equal 5, @sc.key_gen.length
  end

  def test_it_gets_valid_offset_string
    assert_equal 4, @sc.offset_number.length
    assert_equal String, @sc.offset_number.class
  end

  def test_date_string
    assert_equal String, @sc.date_string.class
    assert_equal 8, @sc.date_string.length
    # stub time to test 
  end

  def test_it_calculates_total_shifts
    @sc2 = ShiftCalculator.new
    @sc2.stubs(:offset_number).returns('4441')
    @sc2.stubs(:key_base).returns('12345')

    assert_equal 16, @sc2.shift('a')
    assert_equal 27, @sc2.shift('b')
    assert_equal 38, @sc2.shift('c')
    assert_equal 46, @sc2.shift('d')
  end

  def test_typed_offset
    @sc.stubs(:offset_number).returns('4321')

    assert_equal 4, @sc.typed_offset('a')
    assert_equal 3, @sc.typed_offset('b')
    assert_equal 2, @sc.typed_offset('c')
    assert_equal 1, @sc.typed_offset('d')
  end

  def test_key_range_gets_valid_values
    @sc.stubs(:key_base).returns('12345')

    assert_equal 12, @sc.key_range('a')
    assert_equal 23, @sc.key_range('b')
    assert_equal 34, @sc.key_range('c')
    assert_equal 45, @sc.key_range('d')
  end
end
