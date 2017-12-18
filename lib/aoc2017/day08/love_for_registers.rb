module Aoc2017
  module Day08
    class << self

      def love_for_registers(filename)
        # Get absolute pathname
        file = File.join(File.dirname(__FILE__), filename)
        registers = Hash.new(0)

        # Read and process every instruction
        File.readlines(file).each do |line|
          # Tokenize instruction
          data = line.split
          register = data[0]
          opcode = data[1] == 'inc' ? :+ : :-
          value = data[2].to_i
          cond_reg = data[4]
          cond_oper = data[5].to_sym
          cond_val = data[6].to_i

          # Check condition
          if registers[cond_reg].send(cond_oper, cond_val)
            registers[register] = registers[register].send(opcode, value)
          end
        end

        # Return max register value
        registers.values.max
      end

      def love_for_registers_two(filename)
        # Get absolute pathname
        file = File.join(File.dirname(__FILE__), filename)
        registers = Hash.new(0)
        max_value = 0

        # Read and process every instruction
        File.readlines(file).each do |line|
          # Tokenize instruction
          data = line.split
          register = data[0]
          opcode = data[1] == 'inc' ? :+ : :-
          value = data[2].to_i
          cond_reg = data[4]
          cond_oper = data[5].to_sym
          cond_val = data[6].to_i

          # Check condition
          if registers[cond_reg].send(cond_oper, cond_val)
            registers[register] = registers[register].send(opcode, value)
            max_value = registers[register] if registers[register] > max_value
          end
        end

        # Return max register value
        max_value
      end

    end
  end
end
