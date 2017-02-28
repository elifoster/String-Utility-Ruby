require 'test/unit'
if ARGV.include?('gem')
  require 'string-utility'
else
  require_relative '../lib/utils'
end

class TestStringUtility < Test::Unit::TestCase
  using StringUtility
  def test_separate
    value = '1000'
    assert_equal('1,000', value.separate)
    assert_equal('1000', value)

    value = '1000'
    assert_equal('10,00', value.separate(2))
    assert_equal('1000', value)

    value = '1000'
    assert_equal('1:000', value.separate(3, ':'))
    assert_equal('1000', value)

    value = '1000'
    assert_equal('10:00', value.separate(2, ':'))
    assert_equal('1000', value)

    value = '100'
    assert_equal('100', value.separate)
    assert_equal('100', value)
  end

  def test_to_i_sparated
    value = '1,000'
    assert_equal(1000, value.to_i_separated)
    assert_equal('1,000', value)

    value = '1000'
    assert_equal(1000, value.to_i_separated)
    assert_equal('1000', value)
  end

  def test_underscorify
    value = ' '
    assert_equal('_', value.underscorify)
    assert_equal(' ', value)

    value = 'Test'
    assert_equal('Test', value.underscorify)
    assert_equal('Test', value)

    value = ' '
    value.underscorify!
    assert_equal('_', value)

    value = 'Test'
    value.underscorify!
    assert_equal('Test', value)
  end

  def test_spacify
    value = '_'
    assert_equal(' ', value.spacify)
    assert_equal('_', value)

    value = 'Test'
    assert_equal('Test', value.spacify)
    assert_equal('Test', value)

    value = '_'
    value.spacify!
    assert_equal(' ', value)

    value = 'Test'
    value.spacify!
    assert_equal('Test', value)
  end

  def test_random_line
    assert_instance_of(String, StringUtility.random_line("#{Dir.pwd}/spec/testcases.rb"))
  end

  def test_random_color_three
    assert_instance_of(String, StringUtility.random_color_three)
  end

  def test_random_color_six
    assert_instance_of(String, StringUtility.random_color_six)
  end
end
