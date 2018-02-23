require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require 'pry'

require_relative '../lib/player'

# Get that nice colorized output
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Player' do

  describe 'new' do
    it 'returns the value of the @name instance variable' do
      jim = Scrabble::Player.new("Jim")
      jim.name.must_equal "Jim"
    end
  end

  describe 'plays' do
    it 'returns an Array of the words played by the player' do
      jim = Scrabble::Player.new("Jim")
      played_words = ["cat", "man", "trees"]

      played_words.each do |word|
        jim.play(word)
      end

      jim.plays.must_equal ["cat", "man", "trees"]
    end
  end

  describe 'play' do
    it "adds the input word to the plays Array"  do
    jim = Scrabble::Player.new("Jim")
    jim.play("apple")
    jim.play("pear")
    jim.play("rock")

    jim.plays.must_equal ["apple", "pear", "rock"]
    end
  end

  xdescribe '#total_score' do
    it 'returns the sum of scores of played words' do

    end
  end

  xdescribe '#won' do
    it 'If the player has over 100 points, returns true, otherwise returns false' do
    end
  end

  xdescribe '#highest_scoring_word' do
    it 'returns the highest scoring played word' do
    end
  end

  xdescribe '#highest_word_score' do
    it 'returns the highest_scoring_word score' do
    end

  end
end
