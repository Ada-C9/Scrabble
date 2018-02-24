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
      result = player.plays

      result.must_be_kind_of Array
    end
    # it "returns an empty array if no words are played" do
    #   result = Scrabble::Player.play()
    # end #it

  end

  describe "#play(word)" do
    it "adds input word to the plays Array" do
      player = Scrabble::Player.new("kiera")
      player.play("word")

      player.plays.must_equal ["word"]

    end
  end
  describe "#total_score" do
    it "Returns the sum of scores of played words" do
      player = Scrabble::Player.new("player")
      player.play("dog")
      player.play("fish")

      player.total_score.must_equal 15
    end
  end

  describe "#won?" do
    it'if player has 100 or more points return true'  do

      player = Scrabble::Player.new("player")
      player.play("zzzzzzz")
      player.play("zzzzzzz")


      player.won?.must_equal true

    end

    it'if player has under 100 points return false'  do

      player = Scrabble::Player.new("player")
      player.play("dog")

      player.won?.must_equal false

    end
  end
end
