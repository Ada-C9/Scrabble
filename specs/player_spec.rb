require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/player.rb'
require_relative '../lib/scoring.rb'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Player' do

  describe 'initialize' do

    it "The new player must be an instance of Player" do
      Scrabble::Player.new("Ana").must_be_instance_of Scrabble::Player
    end

    it "The name is a kind of string" do
      Scrabble::Player.new(43687).name.must_be_kind_of String
    end
  end

  describe 'plays' do
    it "returns an array" do
      player_1 = Scrabble::Player.new("Wini")
      player_1.plays.must_be_kind_of Array
    end

    it "returns an array of words played" do
      player_1 = Scrabble::Player.new("Wini")
      player_1.play("hello")
      player_1.play("hi")
      player_1.plays.must_equal ["hello", "hi"]
    end
  end

  describe 'play' do
    it "adds a word to plays method" do
      player_1 = Scrabble::Player.new("Dan")
      player_1.play("xx")
      player_1.words_played.must_include "xx"
    end

    it "must return the score of the word if the game is not won" do
      player_1 = Scrabble::Player.new("Dan")
      player_1.play("xx").must_equal 20
    end

    it 'must return false if the game is won' do
      player_1 = Scrabble::Player.new("Dan")
      player_1.play("zzzzffd")
      word = "xx"
      player_1.play(word).must_equal false
    end

    it "must return zero if the word played is a blank string" do
      player_1 = Scrabble::Player.new("Dan")
      word = ""
      player_1.play(word).must_equal 0
    end
  end

  describe "Total score"  do
    it "returns the the sum score of played words" do
      player_1 = Scrabble::Player.new("Dan")
      player_1.play("hello")
      player_1.play("hi")
      player_1.play("hey")

      player_1.total_score.must_equal 22
    end
  end

  describe "won?" do
    it "returns true if total score is more than 100" do
      player_1 = Scrabble::Player.new("Dan")
      player_1.play("zzzzzzz")

      player_1.won?.must_be true
    end

    it "returns false if total score is equal to 100" do
      player_1 = Scrabble::Player.new("Dan")
      player_1.play("zzzzffd")

      player_1.won?.must_be false
    end

    it "returns false if total score is less than 100" do
      player_1 = Scrabble::Player.new("Dan")
      player_1.play("bob")

      player_1.won?.must_be false
    end
  end

  describe "highest_scoring_word" do
    it "must return a string" do
      player_1 = Scrabble::Player.new("Dan")
      player_1.play("hello")

      player_1.highest_scoring_word.must_be_kind_of String
    end

    it "returns the highest score" do
      player_1 = Scrabble::Player.new("Dan")
      player_1.play("hello")
      player_1.play("hi")
      player_1.play("hey")

      player_1.highest_scoring_word.must equal "hey"
    end
  end

  describe "highest_word_score" do
    it "must return an integer" do
      player_1 = Scrabble::Player.new("Dan")
      player_1.play("hello")

      player_1.highest_word_score.must_be_kind_of Integer
    end

    it "returns the score of the highest scoring word" do
      player_1 = Scrabble::Player.new("Dan")
      player_1.play("hello")
      player_1.play("hi")
      player_1.play("hey")

      player_1.highest_word_score.must_equal 9
    end
  end
end
