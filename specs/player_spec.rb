require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/player'
require_relative '../lib/scoring'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Player' do

  before do
    @john = Scrabble::Player.new("John")

  end

  describe 'initialize' do
    it 'Takes in a name' do
      @john.must_respond_to :name
      @john.name.must_equal "John"
      @john.name.must_be_kind_of String
    end

    it 'returns an array' do
      @john.played_words.must_be_kind_of Array
      @john.played_words.must_equal []
    end
  end

  describe 'play' do
    it 'takes in a word' do
      @john.must_respond_to :play
    end

    it 'word is added to play array' do
      @john.play("snail")
      @john.played_words.must_include "snail"
    end

    it 'returns false if game is over (player has already won)' do
      @john.total_score = 100
      @john.play('dog').must_equal false
    end

    it 'returns score of word' do
      @john.play("snail").must_equal 5
      @john.play("snail").must_be_kind_of Integer
    end
  end

  describe 'total_score' do
    it 'returns sum of played words' do
      @john.played_words.push("board", "cup")

      @john.total_score.must_equal 15
    end
  end

  describe "won?" do
    it "returns true if player has 100 points" do
      @john.total_score = 100
      @john.won?.must_equal true
    end

    it "returns false if player does not have 100 points" do
      @john.total_score = 99
      @john.won?.must_equal false
    end
  end

  describe "highest_scoring_word" do
    it 'returns the highest scoring word' do
      @john.played_words.push("cat", "zebra")
      @john.highest_scoring_word.must_equal "zebra"
    end

    it 'returns score of 7 letter word over other' do
      @john.played_words.push("aaaaaah", "zzzzzz")
      @john.highest_scoring_word.must_equal "aaaaaah"
    end
  end

  describe "highest_word_score" do
    it 'returns the highest score played' do
      @john.played_words.push("cat", "zebra")
      @john.highest_word_score.must_equal 16
    end
  end
end
