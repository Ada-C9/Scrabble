require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/player'

# Get that nice colorized output
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'player tests' do
  it 'it takes a players name' do
  # assemble
  name = Scrabble::Player.new("jill")
  # act
  name.must_equal "jill"
  # assert
  end 
end
