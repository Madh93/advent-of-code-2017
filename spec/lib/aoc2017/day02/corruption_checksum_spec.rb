require 'spec_helper'

describe Aoc2017::Day02 do
  it 'Corruption checksum' do
    Aoc2017::Day02.corruption_checksum('example_input.txt').must_equal(18)
    Aoc2017::Day02.corruption_checksum('input.txt').must_equal(21845)
  end

  it 'Corruption checksum: Part Two' do
    Aoc2017::Day02.corruption_checksum_two('example_input_two.txt').must_equal(9)
    Aoc2017::Day02.corruption_checksum_two('input.txt').must_equal(191)
  end
end
