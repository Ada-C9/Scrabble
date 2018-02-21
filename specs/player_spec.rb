require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/player'
require_relative '../lib/scoring'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Player' do
  describe 'initialize' do
    it 'Takes in a name' do
      john = Scrabble::Player.new("John")

      john.must_respond_to :name
      john.name.must_equal "John"
      john.name.must_be_kind_of String
    end
  end
end
