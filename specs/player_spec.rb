require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/scoring'

# Get that nice colorized output
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Player' do
  describe 'plays' do

    it 'correctly returns an array of the words played by the player' do
      Scrabble::Player.plays.must_be Array
    end
  end
end
