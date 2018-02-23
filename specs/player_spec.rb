require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/player'
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Player' do
  before do
    @player = Scrabble::Player.new("kate")
    @player.play("dog")
    @player.play("cat")
    @player.play("rooster")
  end

  describe '#initialize method' do
    it "responds to the instance variables " do

      @player.must_respond_to :name
      @player.name.must_equal "kate"

    end

    it "Creates a player with an Array of played words" do

      @player.must_respond_to :plays
      #@player.plays.must_equal ["dog","cat","rooster"]
      @player.plays.must_be_instance_of Array
    end

    it "responds to the total_score to 0" do

      @player.must_respond_to :total
    end
  end

  describe '#play method' do
    it "Scrabble::Player responds to plays" do

      @player.must_respond_to :play
      @player.must_respond_to :plays
    end

    it "adds an input word to plays array" do

      @player.play("tiger")
      @player.plays.must_include "tiger"
    end

    it "returns an array of words" do

      @player.plays.must_equal ["dog","cat","rooster"]
      @player.plays.must_be_kind_of Array
    end


    it "returns false if the player has won" do
      @player.play("qqqqqqqq")
      @player.won?.must_equal false
    end

    it "returns the score of the word" do

      @player.play("dog").must_equal 5
    end
  end

  describe "#total_score method" do
    it "responds to total_score of the played word" do

      @player.total_score.must_equal 67
      @player.total_score.must_be_kind_of Integer
      @player.must_respond_to :total_score
    end
  end

  describe "#won? method" do
    it "returns true if total_score greater than or equal to 100" do

      @player.play("qqqq")
      @player.total_score
      @player.won?.must_equal true
      @player.must_respond_to :won?
    end
  end

  describe "The Highest_score_word" do
    it "returns the highest scoring played word" do

      @player.highest_scoring_word.must_equal "rooster"
      @player.must_respond_to :highest_scoring_word
    end
  end

  describe "#The highest_word_score method" do
    it "returns the score of a highest_scoring_word" do

      @player.highest_word_score.must_equal 57
      @player.must_respond_to :highest_word_score
    end
  end

  describe "# draw_tiles method" do
    it "Should be a collection of letters" do

      @player.tiles.must_be_kind_of Array
      @player.must_respond_to :tiles
    end

    it "it allows the player to play max 7" do
      @player.tiles.length.must_equal 7
    end

  end


end
