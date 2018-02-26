require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/scoring'

# Get that nice colorized output
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Scoring' do
  describe 'score' do
    xit 'correctly scores simple words' do
      Scrabble::Scoring.score('dog').must_equal 5
      Scrabble::Scoring.score('cat').must_equal 5
      Scrabble::Scoring.score('pig').must_equal 6
    end

    xit 'adds 50 points for a 7-letter word' do
      Scrabble::Scoring.score('academy').must_equal 65
    end

    xit 'handles all upper- and lower-case letters' do
      Scrabble::Scoring.score('dog').must_equal 5
      Scrabble::Scoring.score('DOG').must_equal 5
      Scrabble::Scoring.score('DoG').must_equal 5
    end

    xit 'returns nil for strings containing bad characters' do
      Scrabble::Scoring.score('#$%^').must_be_nil
      Scrabble::Scoring.score('char^').must_be_nil
      Scrabble::Scoring.score(' ').must_be_nil
    end

    xit 'returns nil for words > 7 letters' do
      Scrabble::Scoring.score('abcdefgh').must_be_nil
    end

    xit 'returns nil for empty words' do
      Scrabble::Scoring.score('').must_be_nil
    end
  end

  describe 'highest_score_from' do
    it 'returns nil if no words were passed' do
      array_of_words  = []
      Scrabble::Scoring.highest_score_from(array_of_words).must_be_nil
    end

    it 'returns the only word in a length-1 array' do
      array_of_words = ['one']
      Scrabble::Scoring.highest_score_from(array_of_words).must_equal('one')
    end

    it 'returns the highest word if there are two words' do
      array_of_words = ["zebra", "zebras"]
      Scrabble::Scoring.highest_score_from(array_of_words).must_equal("zebras")
    end

    it 'if tied, prefer a word with 7 letters' do
      array_of_words = ["ww", "bananas"]
      Scrabble::Scoring.highest_score_from(array_of_words).must_equal("bananas")
    end

    it 'if tied and no word has 7 letters, prefers the word with fewer letters' do
      array_of_words = ["x", "brasas"]
      Scrabble::Scoring.highest_score_from(array_of_words).must_equal("x")
    end

    it 'returns the first word of a tie with same letter count' do
      array_of_words = ["zebraa", "zebras"]
      Scrabble::Scoring.highest_score_from(array_of_words).must_equal("zebraa")
    end
  end
end
