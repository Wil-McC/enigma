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
end
