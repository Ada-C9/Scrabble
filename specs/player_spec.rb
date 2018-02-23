require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/player'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe "Player" do
  describe "#initialize" do
    it 'takes in player name as argument' do
      name = "Kiera"
      player = Scrabble::Player.new(name)

      player.name.must_equal name
    end #it
  end

  describe "#plays" do
    it 'returns an array of words played by player' do
      player = Scrabble::Player.new("kiera")
      result = Scrabble::Player.plays(player)

      result.must_be_kind_of Array
    end
    it "returns an empty array if no words are played" do
      
    end #it

  end
end
end
