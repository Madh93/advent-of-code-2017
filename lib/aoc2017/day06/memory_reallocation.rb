module Aoc2017
  module Day06
    class << self

      def memory_reallocation(filename)
        # Get absolute pathname
        file = File.join(File.dirname(__FILE__), filename)

        # Store memory banks in an array
        banks = File.read(file).split.map(&:to_i)
        states = []
        cycles = 0

        # Repeat until exists repeated state
        until states.include?(banks)
          # Add current banks copy to states array
          states << banks.dup

          # Get max block and index
          max_blocks, index = banks.each.with_index.max_by(&:first)

          # Reallocate blocks
          banks[index] = 0
          1.upto(max_blocks) { |i| banks[(index + i) % banks.size] += 1 }

          cycles += 1
        end

        # Return redistribution cycles
        cycles
      end

      def memory_reallocation_two(filename)
        # Get absolute pathname
        file = File.join(File.dirname(__FILE__), filename)

        # Store memory banks in an array
        banks = File.read(file).split.map(&:to_i)
        states = []
        seen_state = nil
        cycles = 0

        # Repeat until exists repeated state
        until banks == seen_state

          # Store the already seen state
          seen_state = banks.dup if states.include?(banks) && seen_state.nil?

          # Add current banks copy to states array
          states << banks.dup

          # Get max block and index
          max_blocks, index = banks.each.with_index.max_by(&:first)

          # Reallocate blocks
          banks[index] = 0
          1.upto(max_blocks) { |i| banks[(index + i) % banks.size] += 1 }

          cycles += 1 unless seen_state.nil?
        end

        # Return redistribution cycles
        cycles
      end

    end
  end
end
