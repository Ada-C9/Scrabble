require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/player.rb'

# Get that nice colorized output
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'player tests' do
  it 'it takes a players name' do
  # assemble
  new_player = Scrabble::Player.new()
  # act/assert

  end
end
