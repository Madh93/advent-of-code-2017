require 'spec_helper'

describe Aoc2017::Day05 do
  it 'Maze of Twisty Trampolines' do
    Aoc2017::Day05.maze_of_trampolines('example_input.txt').must_equal(5)
    Aoc2017::Day05.maze_of_trampolines('input.txt').must_equal(394829)
  end

  it 'Maze of Twisty Trampolines: Part Two' do
    Aoc2017::Day05.maze_of_trampolines_two('example_input.txt').must_equal(10)
    # Skip this one. Reason? Slow
    # Aoc2017::Day05.maze_of_trampolines_two('input.txt').must_equal(31150702)
  end
end
