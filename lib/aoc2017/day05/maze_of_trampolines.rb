module Aoc2017
  module Day05
    class << self

      def maze_of_trampolines(filename)
        # Get absolute pathname
        file = File.join(File.dirname(__FILE__), filename)

        # Store offsets in an array
        offsets = File.readlines(file).map(&:to_i)
        index = steps = 0

        # Repeat jumps until escaping the maze
        until offsets[index].nil?
          aux = index
          index += offsets[index]
          offsets[aux] += 1
          steps += 1
        end

        # Return steps
        steps
      end

      def maze_of_trampolines_two(filename)
        # Get absolute pathname
        file = File.join(File.dirname(__FILE__), filename)

        # Store offsets in an array
        offsets = File.readlines(file).map(&:to_i)
        index = steps = 0

        # Repeat jumps until escaping the maze
        until offsets[index].nil?
          aux = index
          index += offsets[index]
          offsets[aux] += (offsets[aux] < 3 ? 1 : -1)
          steps += 1
        end

        # Return steps
        steps
      end

    end
  end
end
