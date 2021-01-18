require_relative 'test_helper'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists_with_attributes
    assert_instance_of Enigma, @enigma
  end

  def test_it_encrypts
    expected = {
      encryption: 'keder ohulw',
      key: '02715',
      date: '040895'
    }
    assert_equal expected, @enigma.encrypt('hello world','02715','040895')
  end

  def test_it_encrypts_uppercases
    expected = {
      encryption: 'keder ohulw',
      key: '02715',
      date: '040895'
    }
    assert_equal expected, @enigma.encrypt('Hello World','02715','040895')
    assert_equal expected, @enigma.encrypt('HELLO WORLD','02715','040895')
  end

  def test_it_decrypts
    expected = {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, @enigma.decrypt('keder ohulw','02715','040895')
  end

  def test_it_passes_over_unknown_characters
    expected = {
      encryption: 'keder ohulw!',
      key: '02715',
      date: '040895'
    }
    assert_equal expected, @enigma.encrypt('hello world!','02715','040895')
  end

  def test_it_encrypts_without_optional_args
    @enigma.stubs(:key_gen).returns('12345')
    @enigma.stubs(:today_date_string).returns('220121')
    expected = {
      :encryption=>"xgwddbgggno",
      :key=>"12345",
      :date=>"220121"
    }
    assert_equal expected, @enigma.encrypt('hello world')
  end

  def test_it_decrypts_without_date
    @enigma.stubs(:key_gen).returns('12345')
    @enigma.stubs(:today_date_string).returns('220121')
    expected = {
      :decryption=>"hello world",
      :key=>"12345",
      :date=>"220121"
    }
    assert_equal expected, @enigma.decrypt("xgwddbgggno", '12345')
  end

  # Generator module tests

  def test_today_date_string
    assert_equal String, @enigma.today_date_string.class
    assert_equal 6, @enigma.today_date_string.length
    new_date = DateTime.new(2022, 7, 7, 1, 1, 1)
    Time.stubs(:now).returns(new_date)
    assert_equal '070722', @enigma.today_date_string
  end

  def test_it_gets_valid_offset_number
    assert_equal 4, @enigma.offset_number('040895').length
    assert_equal String, @enigma.offset_number('040895').class
    assert_equal '1025', @enigma.offset_number('040895')
  end

  def test_key_gen
    assert_equal String, @enigma.key_gen.class
    assert_equal 5, @enigma.key_gen.length
  end

  def test_it_has_num_array
    def test_it_has_nums
      assert_equal ('0'..'9').to_a, @enigma.num_array
      assert_equal 10, @enigma.num_array.length
    end
  end

  def test_it_has_char_array
    assert_equal ("a".."z").to_a << " ", @enigma.char_array
    assert_equal 27, @enigma.char_array.length
  end
end
