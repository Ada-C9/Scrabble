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

    end

    it "Returns score of word if player has not already won" do

    end

  end

  describe 'total_score' do

    it "Returns the sum of scores of played words" do
      @player_1.plays = ["grawlix", "butter", "bacon"]

      @player_1.total_score.must_equal 85
    end

  end

  describe 'won?' do

    before do
      @player_2 = Scrabble::Player.new("Bertram")
    end

    it "Returns true if the player has over 100 points" do

      @player_2.plays = ["pizzazz", "bezique"]
      @player_2.won?.must_equal true
    end

    it "Returns false if player has 100 points or less" do

      @player_2.plays = ["were", "wolf", "bar", "mitzva"]
      @player_2.won?.must_equal false


    end

    it "Returns false if the player has not played any words." do

    end

  end

  describe 'highest_scoring_word' do

    it "Returns the highest scoring played word" do

    end

  end

  describe 'highest_word_score' do

    it "Returns the highest_scoring_word score" do

    end

  end

end
