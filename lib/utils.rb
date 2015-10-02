module StringUtility

  # Separates the string by another string. Useful for converting integers into human-readable numbers.
  # @param string [String] The string to separate.
  # @param count [Int] The number of integers to separate by. Defaults to 3.
  # @param separator [String] The string to use as a separator. Can only be 1 character long. Will use the first character if it is greater than 1 character long. Defaults to a comma.
  # @return [String] Formatted version of the provided string.
  def self.separate_with(string, count = 3, separator = ',')
    if separator.length > 1
      separator = separator[0]
    end
    string = string.reverse!
    array = string.scan(/.{1,#{count}}/)
    string = array.join(separator)
    string = string.reverse!
    return string
  end

  def separate_with(string, count = 3, separator = ',')
    StringUtility.separate_with(string, count, separator)
  end
end
