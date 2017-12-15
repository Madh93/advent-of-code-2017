module Aoc2017
  module Day02
    class << self

      def corruption_checksum(filename)
        # Get absolute pathname
        file = File.join(File.dirname(__FILE__), filename)

        # Find for each line the difference between largest and smallest values
        File.readlines(file).map do |line|
          line.split.map(&:to_i).minmax.reduce(:-).abs
        end.sum
      end

      # --- Part Two ---
      def corruption_checksum_two(filename)
        # Get absolute pathname
        file = File.join(File.dirname(__FILE__), filename)

        File.readlines(file).map do |line|
          # Get all pair permutations
          pairs = line.split.map(&:to_i).permutation(2)

          # Find the divisible pair and get the division
          pairs.find { |p| p.reduce(:%).zero? }.reduce(:/)
        end.sum
      end

    end
  end
end
