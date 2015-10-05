module StringUtility
  refine String do
    # Separates the string by another string. Useful for converting integers
    #   into human-readable numbers.
    # @param count [Int] The number of integers to separate by. Defaults to 3.
    # @param separator [String] The string to use as a separator. Can only be
    #   1 character long. Will use the first character if it is greater than
    #   1 character long. Defaults to a comma.
    # @return [String] Formatted version of the provided string.
    def separate(count = 3, separator = ',')
      separator = separator[0] if separator.length > 1
      string = self
      string = string.reverse
      array = string.scan(/.{1,#{count}}/)
      string = array.join(separator)
      string = string.reverse

      string
    end
  end
end
