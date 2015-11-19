require 'test/unit'
require_relative '../lib/utils'

class TestStringUtility < Test::Unit::TestCase
  using StringUtility
  def test_separate
    assert_equal('1,000', '1000'.separate)
    assert_equal('10,00', '1000'.separate(2))
    assert_equal('1:000', '1000'.separate(3, ':'))
    assert_equal('10:00', '1000'.separate(2, ':'))
  end

  def test_to_i_sparated
    assert_equal(1000, '1,000'.to_i_separated)
  end

  def test_underscorify
    assert_equal('_', ' '.underscorify)
  end

  def test_spacify
    assert_equal(' ', '_'.spacify)
  end

  def test_random_line
    assert_instance_of(String, StringUtility.random_line("#{Dir.pwd}/" \
                                                         'spec/testcases.rb'))
  end

  def test_random_color_three
    assert_instance_of(String, StringUtility.random_color_three)
  end

  def test_random_color_six
    assert_instance_of(String, StringUtility.random_color_six)
  end
end
