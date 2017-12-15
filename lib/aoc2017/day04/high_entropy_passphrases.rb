module Aoc2017
  module Day04
    class << self

      def high_entropy_passphrases(filename)
        # Get absolute pathname
        file = File.join(File.dirname(__FILE__), filename)

        # Count the valid passphrases (without duplicate values)
        File.readlines(file).count do |line|
          line.split == line.split.uniq
        end
      end

      def high_entropy_passphrases_two(filename)
        # Get absolute pathname
        file = File.join(File.dirname(__FILE__), filename)

        # Count the valid passphrases (without anagrams of each other)
        File.readlines(file).count do |line|
          line.split.size == line.split.map(&:chars).map(&:sort).uniq.size
        end
      end

    end
  end
end
