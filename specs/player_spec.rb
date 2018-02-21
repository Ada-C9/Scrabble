require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/player.rb'
require_relative '../lib/scoring.rb'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Player' do

  xdescribe 'initialize' do

    it "The new player must be an instance of Player" do
      Scrabble::Player.new("Ana").must_be_instance_of Scrabble::Player
    end

    it "The name is a kind of string" do
      Scrabble::Player.new(43687).name.must_be_kind_of String
    end
  end

  xdescribe 'plays' do
    it "returns an array" do
      Scrabble::Player.plays.must_be_kind_of Array
    end

    it "returns an array of words played" do

    end
  end

  xdescribe 'play' do
    it "adds a word to plays method" do
      words_played = Scrabble::Player.plays
      new_word = "xx"
      Scrabble::Player.play(new_word)
      words_played.must_include new_word
    end

    it "must return the score of the word if the game is not won" do
      word = "xx"
      Scrabble::Player.play(word).must_equal 20
    end

    it 'must return false if the game is won' do
      Scrabble::Player.total_score = 101
      word = "xx"
      Scrabble::Player.play(word).must_equal false
    end

    it "must return zero if the word played is a blank string" do
      word = ""
      Scrabble::Player.play(word).must_equal 0
    end
  end

  describe "Total score"  do
    it "return the the sum score of played words" do
      score_1 = Scrabble::Player.play("hello")
      score_2 = Scrabble::Player.play("hi")
      score_3 = Scrabble::Player.play("hey")

      Scrabble::Player.total_score.must_equal 22
    end
  end

  describe "won?" do
    it "returns true if total score is more than 100" do
      score_1 = Scrabble::Player.play("zzzzzzz")

      Scrabble::Player.won?.must_be true
    end

    it "returns false if total score is  equal than 100" do
      score_1 = Scrabble::Player.play("zzzzffd")

      Scrabble::Player.won?.must_be false
    end

    it "returns false if total score is less than 100" do
      score_1 = Scrabble::Player.play("bob")

      Scrabble::Player.won?.must_be false
      
    end
  end
end
