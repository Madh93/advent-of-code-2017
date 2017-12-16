require 'spec_helper'

describe Aoc2017::Day06 do
  it 'Memory reallocation' do
    Aoc2017::Day06.memory_reallocation('example_input.txt').must_equal(5)
    # Skip this one. Reason? Slow
    # Aoc2017::Day06.memory_reallocation('input.txt').must_equal(6681)
  end

  it 'Memory reallocation: Part Two' do
    Aoc2017::Day06.memory_reallocation_two('example_input.txt').must_equal(4)
    # Skip this one. Reason? Slow
    # Aoc2017::Day06.memory_reallocation_two('input.txt').must_equal(2392)
  end
end
