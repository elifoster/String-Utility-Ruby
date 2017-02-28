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
      chars.reverse!.each_slice(count).map(&:join).join(separator[0]).reverse!
    end

    # Converts a separated string into an integer. This is basically the reverse of #separate. Does not modify the
    #   source string.
    # @return [Integer] The integer version of the separated string.
    def to_i_separated
      gsub(/\D/, '').to_i
    end

    # Replaces all whitespace with underscores. Does not modify the source string.
    # @return [String] A new string with replaced whitespace.
    def underscorify
      gsub(/\s/, '_')
    end

    # Replaces all whitespace with underscores. Modifies the source string in-place.
    # @return [String] see #safely_gsub!
    def underscorify!
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
  # This will include newlines and similar characters, so you may want to chomp the result.
  # @param path [String] The path to the file.
  # @return [String] A random line in the file.
  def self.random_line(path)
    lines = File.readlines(path)
    lines[rand(lines.count)]
  end

  # Gets a random three-digit hexadecimal web color string.
  # @return [String] A random hexadecimal.
  def self.random_color_three
    random_color(3)
  end

  # Gets a random six-digit hexadecimal web color string.
  # @return [String] See #random_color_three
  def self.random_color_six
    random_color(6)
  end

  private

  STRING_VALS = ('A'..'F').to_a.freeze
  INT_VALS = (0..9).to_a.freeze
  COMBINED_VALS = (STRING_VALS + INT_VALS).freeze

  def random_color(limit)
    str = '#'
    limit.times do
      str << COMBINED_VALS.sample.to_s
    end
    str
  end
end
