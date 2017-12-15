require 'rake/testtask'
require 'optparse'
require 'fileutils'

task default: :test

desc 'Run tests'
task :test do
  Rake::TestTask.new do |t|
    t.libs << "lib"
    t.test_files = FileList['spec/*_spec.rb', 'spec/lib/aoc2017/*/*_spec.rb']
    # t.verbose = true
  end
end

namespace :solution do

  desc 'Create a new solution'
  task :create do
    options = { day: nil, name: nil }
    option_parser = OptionParser.new do |opts|
      opts.banner = "Usage: rake solution:create [options]"
      opts.on('-d', '--day NUMBER') { |d| options[:day] = d }
      opts.on('-n', '--name NAME') { |n| options[:name] = n }
    end

    # return `ARGV` with the intended arguments
    # http://www.mikeball.info/blog/rake-option-parser/
    args = option_parser.order!(ARGV) {}
    option_parser.parse!(args)

    raise OptionParser::MissingArgument if options.values.any?(&:nil?)

    # Sanitize solution name
    name = options[:name].downcase.gsub(/[^0-9A-Za-z.\-]/, '_')
    number = options[:day]
    day_path = "lib/aoc2017/day#{number}"

    # Create Days directories
    Dir.mkdir(day_path)
    Dir.mkdir("spec/#{day_path}")

    # Add requires
    File.open("lib/aoc2017.rb", 'a') { |f| f << "require 'aoc2017/day#{number}/#{name}'\n" }

    File.open("#{day_path}/#{name}.rb", 'w') do |f|
      f << "module Aoc2017\n"
      f << "  module Day#{number}\n"
      f << "    class << self\n\n"
      f << "      def #{name}\n"
      f << "      end\n\n"
      f << "    end\n"
      f << "  end\n"
      f << "end\n"
    end

    File.open("#{day_path}/README.md", 'w') do |f|
      f << "# Day#{options[:day]}: #{options[:name]}\n\n"
      f << "[Link]()\n\n"
      f << "## Instructions\n\n"
    end

    File.open("spec/#{day_path}/#{name}_spec.rb", 'w') do |f|
      f << "require 'spec_helper'\n\n"
      f << "describe Aoc2017::Day#{number} do\n"
      f << "  it '' do\n"
      f << "    Aoc2017::Day#{number}.#{name}().must_equal()\n"
      f << "  end\n"
      f << "end\n"
    end

    puts "Created a new Solution for Day#{number}: '#{name}'"
  end

  desc 'Delete a solution'
  task :delete do
    options = { day: nil, name: nil }
    option_parser = OptionParser.new do |opts|
      opts.banner = "Usage: rake solution:delete [options]"
      opts.on('-d', '--day NUMBER') { |d| options[:day] = d }
      opts.on('-n', '--name NAME') { |n| options[:name] = n }
    end

    args = option_parser.order!(ARGV) {}
    option_parser.parse!(args)

    raise OptionParser::MissingArgument if options.values.any?(&:nil?)

    name = options[:name]
    number = options[:day]
    day_path = "lib/aoc2017/day#{number}"

    if !Dir.exist?(day_path)
      puts "Solution '#{name}' does not exist!"
      exit
    end

    FileUtils.rm_rf(day_path)
    FileUtils.rm_rf("spec/#{day_path}")

    # Remove requieres
    requires_file = "lib/aoc2017.rb"
    File.open("#{requires_file}.tmp", "w") do |out_file|
      File.foreach(requires_file) do |line|
        out_file.puts line unless line.include?("require 'aoc2017/day#{number}'")
      end
    end

    FileUtils.mv("#{requires_file}.tmp", requires_file)

    if File.exist?("spec/#{day_path}/#{name}_spec.rb")
      File.delete("spec/#{day_path}/#{name}_spec.rb")
    end

    puts "Deleted the Solution for Day#{number}: '#{options[:name]}'"
  end

  desc 'List all solutions'
  task :list do
    solutions = 'lib/aoc2017'
    Dir.entries(solutions).reject { |e| e.include?('.') }.each do |day|
      Dir.entries("#{solutions}/#{day}").grep(/\.rb/).each do |name|
        puts "#{day}: #{name}"
      end
    end
  end
end
