require 'spec_helper'

describe Aoc2017::Day04 do
  it 'High-Entropy passphrases' do
    Aoc2017::Day04.high_entropy_passphrases('example_input.txt').must_equal(2)
    Aoc2017::Day04.high_entropy_passphrases('input.txt').must_equal(455)
  end

  it 'High-Entropy passphrases: Part Two' do
    Aoc2017::Day04.high_entropy_passphrases_two('example_input_two.txt').must_equal(3)
    Aoc2017::Day04.high_entropy_passphrases_two('input.txt').must_equal(186)
  end
end
