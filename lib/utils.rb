module StringUtility
  refine String do
    # Separates the string by another string. Useful for converting integers
    #   into human-readable numbers.
    # @param count [Int] The number of integers to separate by. Defaults to 3.
    # @param separator [String] The string to use as a separator. Can only be
    #   1 character long. Will use the first character if it is greater than
    #   1 character long. Defaults to a comma.
    # @return [String] A new formatted version of the provided string.
    def separate(count = 3, separator = ',')
      separator = separator[0]
      string = self
      string.reverse!
      string = string.scan(/.{1,#{count}}/).join(separator)
      string.reverse!
    end

    # Converts a separated string into an integer. This is basically the reverse
    #   of #separate.
    # @return [Int] The integer version of the separated string.
    def to_i_separated
      safely_gsub!(/\D/, '').to_i
    end

    # Replaces all whitespace with underscores.
    # @return [String] The string with replaced whitespace.
    def underscorify
      safely_gsub!(/\s/, '_')
    end

    # Replaces all underscores with whitespace.
    # @return [String] The string with replaced underscores.
    def spacify
      safely_gsub!('_', ' ')
    end

    # Readable shorthand for the only safe, fast way to use gsub! using || operators. Unlike gsub!, safely_gsub! will
    # NEVER return nil. This method should not be used instead of gsub! when the string replacement is predictable, as
    # this method is somewhat slower than gsub! (see spec/benchmark).
    # @see #{String#gsub!} for parameters and other information.
    # @return [String] Exactly what gsub! would return, or self. Never nil.
    def safely_gsub!(pattern, replace)
      gsub!(pattern, replace) || self
    end
  end

  extend self

  # Gets a random line in a file.
  # @param path [String] The path to the file.
  # @return [String] A random line in the file.
  def self.random_line(path)
    file = open(path)
    selected = nil
    file.each_with_index do |line, num|
      int = num == 0 ? 1.0 : 1.0 / num
      selected = line if !line.nil? && rand < int
    end
    file.close
    selected
  end

  # Gets a random three-digit hexadecimal web color string.
  # @return [String] A random hexadecimal.
  def self.random_color_three
    string = random_color(0..2)
    "##{string}"
  end

  # Gets a random six-digit hexadecimal web color string.
  # @return [String] See #random_color_three
  def self.random_color_six
    string = random_color(0..5)
    "##{string}"
  end

  private

  def random_color(limit)
    values = (('A'..'F').to_a + (0..9).to_a)
    limit.map { values.sample }.join
  end
end
