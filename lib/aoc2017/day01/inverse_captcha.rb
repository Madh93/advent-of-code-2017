module Aoc2017
  module Day01
    class << self

      def inverse_captcha(input)
        # Select identical pairs of digits
        pairs = input.chars.cycle.each_cons(2).take(input.size).select do |pair|
          pair.uniq.size <= 1
        end

        # Sum all digits
        pairs.map(&:first).map(&:to_i).sum
      end

      # --- Part Two ---
      def inverse_captcha_two(input)
        # Convert into array of integer digits
        input = input.chars.map(&:to_i)

        # Group in pairs
        pairs = []
        input.size.times do
          pairs << [input[0], input[input.size / 2]]
          input.rotate!
        end

        # Select and sum digits
        pairs.select { |p| p.uniq.size <= 1 }.map(&:first).sum
      end
    end
  end
end
