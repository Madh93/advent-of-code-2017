if ENV["TRAVIS"]
  require 'coveralls'
  Coveralls.wear!
end

$LOAD_PATH << File.expand_path('../../lib', __FILE__)

require 'minitest/autorun'
require 'minitest/pride'
require 'aoc2017'
