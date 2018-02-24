require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require 'pry'

require_relative '../lib/player'

# Get that nice colorized output
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Player' do

  before do
    @player_1 = Scrabble::Player.new("Nora")
    @player_2 = Scrabble::Player.new("Bertram")
  end

  describe 'initialize' do

    it "Takes a player name" do
      # player_1 = Scrabble::Player.new("Nora")
      @player_1.name.must_equal "Nora"
    end

  end

  describe 'play(word)' do

    it "Adds the input word to the plays array" do

      @player_1.play("walri")
      @player_1.plays.must_include "walri"
      @player_1.plays.must_be_kind_of Array

    end

    it "Returns false if player has already won" do
      @player_2.plays = ["pizzazz", "bezique"]
      # binding.pry
      @player_2.won?

      @player_2.play("snart").must_equal false
    end

    it "Returns score of word if player has not already won" do
      @player_2.plays = ["were", "wolf", "bar", "mitzva"]

      @player_2.play("snart").must_equal true
    end

  end

  describe 'total_score' do

    it "Returns the sum of scores of played words" do
      @player_1.plays = ["grawlix", "butter", "bacon"]

      @player_1.total_score.must_equal 85
    end

  end

  describe 'won?' do

    it "Returns true if the player has over 100 points" do
      @player_2.plays = ["pizzazz", "bezique"]

      @player_2.won?.must_equal true
    end

    it "Returns false if player has less than 100 points" do
      @player_2.plays = ["were", "wolf", "bar", "mitzva"]

      @player_2.won?.must_equal false

    end

    it "Returns false if player has exactly 100 points" do
      @player_2.plays = ["jalopy", "banjax", "pyjama", "enzyme", "quiche"]

      @player_2.won?.must_equal false

    end

    # it "Returns false if the player has not played any words." do
    #   @player_2.plays = []
    #
    #   @player_2.won?.must_equal false
    # end

  end

  describe 'highest_scoring_word' do

    it "Returns the highest scoring played word" do
      @player_2.plays = ["jalopy", "banjax", "pyjama", "enzyme", "quiche"]
      @player_2.highest_scoring_word.must_equal "banjax"
    end
  end

  describe 'highest_word_score' do

    it "Returns the highest_scoring_word score" do
      @player_2.plays = ["bezique", "pizzazz"]
      @player_2.highest_scoring_word
      @player_2.highest_word_score.must_equal 95
    end

  end

  describe "tiles" do
    it "holds a collection of seven tiles" do
    end
  end

  describe "draw_tiles(tile_bag)" do

    it "pulls tiles from the tile_bag" do
    end

    it "populates the tiles array with up to seven tiles" do
    end
  end
end
