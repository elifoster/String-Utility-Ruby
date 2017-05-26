require 'spec_helper'

describe StringUtility do
  describe '#random_line' do
    it 'returns a random line from a read file' do
      expect(StringUtility.random_line("#{Dir.pwd}/spec/util_spec.rb")).to be_an_instance_of String
    end
  end

  describe '#random_color_three' do
    it 'returns a random hex color of only 3 characters' do
      expect(StringUtility.random_color_three).to be_an_instance_of String
    end
  end

  describe '#random_color_six' do
    it 'returns a random hex color of 6 characters' do
      expect(StringUtility.random_color_six).to be_an_instance_of String
    end
  end

  using StringUtility

  describe 'separate' do
    it 'returns a new string with a character inserted at every nth index' do
      value = '1000'
      expect(value.separate).to eq '1,000'
      expect(value).to eq '1000'
      expect(value.separate(2)).to eq '10,00'
      expect(value).to eq '1000'
      expect(value.separate(2, ':')).to eq '10:00'
      expect(value).to eq '1000'

      value = '100'
      expect(value.separate).to eq '100'
      expect(value).to eq '100'

      value = '1000000000'
      expect(value.separate).to eq '1,000,000,000'
      expect(value).to eq '1000000000'
    end

    it 'inserts a character at every nth index in this string' do
      value = '1000'
      value.separate!
      expect(value).to eq '1,000'

      value = '1000'
      value.separate!(2, ':')
      expect(value).to eq '10:00'

      value = '1000'
      value.separate!(3, ':')
      expect(value).to eq '1:000'

      value = '1000'
      value.separate!(2, ':')
      expect(value).to eq '10:00'

      value = '100'
      value.separate!
      expect(value).to eq '100'

      value = '1000000000'
      value.separate!
      expect(value).to eq '1,000,000,000'
    end
  end

  describe '#to_i_separated' do
    it 'returns an integer in the string when it has been separated with #separate or #separate!' do
      value = '1,000'
      expect(value.to_i_separated).to eq 1000
      expect(value).to eq '1,000'

      value = '1000'
      expect(value.to_i_separated).to eq 1000
      expect(value).to eq '1000'
    end
  end

  describe 'underscorify' do
    it 'returns a new sting with spaces replaced with underscores' do
      value = ' '
      expect(value.underscorify).to eq '_'
      expect(value).to eq ' '

      value = 'Test'
      expect(value.underscorify).to eq 'Test'
      expect(value).to eq 'Test'
    end

    it 'replaces spaces with underscores in this string' do
      value = ' '
      value.underscorify!
      expect(value).to eq '_'

      value = 'Test'
      value.underscorify!
      expect(value).to eq 'Test'
    end
  end

  describe 'spacify' do
    it 'returns a new string with underscores replaced with spaces' do
      value = '_'
      expect(value.spacify).to eq ' '
      expect(value).to eq '_'

      value = 'Test'
      expect(value.spacify).to eq 'Test'
      expect(value).to eq 'Test'
    end

    it 'replaces underscores with spaces in this string' do
      value = '_'
      value.spacify!
      expect(value).to eq ' '

      value = 'Test'
      value.spacify!
      expect(value).to eq 'Test'
    end
  end
end
