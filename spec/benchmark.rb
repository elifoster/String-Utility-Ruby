require 'benchmark'
if ARGV.include?('--gem')
  require 'string-utility'
else
  require_relative '../lib/utils'
end

TIMES = 100_000
using StringUtility
Benchmark.bm do |b|
  b.report('separate') do
    TIMES.times do
      '1000'.separate
    end
  end

  b.report('to_i_separated') do
    TIMES.times do
      '1,000'.to_i_separated
    end
  end

  b.report('underscorify') do
    TIMES.times do
      '     '.underscorify
    end
  end

  b.report('spacify') do
    TIMES.times do
      '_____'.spacify
    end
  end

  b.report('random_line') do
    TIMES.times do
      StringUtility.random_line("#{Dir.pwd}/README.md")
    end
  end

  b.report('color 3') do
    TIMES.times do
      StringUtility.random_color_three
    end
  end

  b.report('color 6') do
    TIMES.times do
      StringUtility.random_color_six
    end
  end
end
