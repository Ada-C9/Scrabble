require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/player'

# Get that nice colorized output
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Player' do
  
  describe '#new' do
    it 'returns the value of the @name instance variable' do
      jim = Scrabble::Player.new("Jim")
      jim.name.must_equal "Jim"
    end

  xdescribe '#plays' do
    it 'returns an Array of the words played by the player' do
      jim = Scrabble::Player.new("Jim")

      plays = ["cat", "man", "trees"]
      plays.each do |word|
        jim.play(word)
      end

      jim.plays.must_equal plays
    end

  xdescribe '#play(word)' do
    xit "adds the input word to the plays Array"  do
      Scrabble::Player.score('dog').must_equal 5
      Scrabble::Player.score('DOG').must_equal 5
      Scrabble::Player.score('DoG').must_equal 5
    end
  end

  xdescribe '#total_score' do
    it 'returns the sum of scores of played words' do

    end

  xdescribe '#won' do
    it 'If the player has over 100 points, returns true, otherwise returns false' do
    end

  xdescribe '#highest_scoring_word' do
    it 'returns the highest scoring played word' do
    end

  xdescribe '#highest_word_score' do
    it 'returns the highest_scoring_word score' do
    end

  end
end
