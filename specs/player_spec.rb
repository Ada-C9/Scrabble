require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/player'
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Player' do
  describe '#initialize' do
    it "takes a name" do
      player = Scrabble::Player.new(name)

      player.class.must_equal Scrabble::Player
      player.must_respond_to :name
    end
  end
end
