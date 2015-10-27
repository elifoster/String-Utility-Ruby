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

    # Converts a separated string into an integer. This is basically the reverse
    #   of #separate.
    # @return [Int] The integer version of the separated string.
    def to_i_separated
      string = self
      string = string.gsub(/\D/, '')
      string.to_i
    end

    # Replaces all whitespace with underscores.
    # @return [String] The string with replaced whitespace.
    def underscorify
      string = self
      string = string.gsub(/\s/, '_')
      string
    end

    # Replaces all underscores with whitespace.
    # @return [String] The string with replaced underscores.
    def spacify
      string = self
      string = string.tr('_', ' ')
      string
    end
  end

  extend self

  # Gets a random line in a file.
  # @param path [String] The path to the file.
  # @return [String] A random line in the file.
  def self.random_line(path)
    read = File.readlines(path)
    read[rand(read.size)].chomp
  end

  def self.random_color_three
    string = random_color(0..2)
    "##{string}"
  end

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
