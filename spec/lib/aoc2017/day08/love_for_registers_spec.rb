require 'spec_helper'

describe Aoc2017::Day08 do
  it 'I Heard You Like Registers' do
    Aoc2017::Day08.love_for_registers('example_input.txt').must_equal(1)
    Aoc2017::Day08.love_for_registers('input.txt').must_equal(4877)
  end

  it 'I Heard You Like Registers: Part Two' do
    Aoc2017::Day08.love_for_registers_two('example_input.txt').must_equal(10)
    Aoc2017::Day08.love_for_registers_two('input.txt').must_equal(5471)
  end
end
