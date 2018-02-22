require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/player'
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Player' do
  describe '#initialize' do
    it "takes a name" do
      player = Scrabble::Player.new("Kate")

      player.class.must_equal Scrabble::Player
      player.must_respond_to :name
      player.name.must_equal "Kate"
    end

    it "Creates a player with an Array of played words" do
      player = Scrabble::Player.new("Kate")

      player.must_respond_to :plays
      player.plays.must_equal []
    end

    it "Initializes the total_score to 0" do
      player = Scrabble::Player.new("kate")
      
      player.must_respond_to :total_score
      player.total_score.must_equal 0
    end
  end



end
