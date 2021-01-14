require_relative 'test_helper'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists_with_attributes
    assert_instance_of Enigma, @enigma
  end
end
