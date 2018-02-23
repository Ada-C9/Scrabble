require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/scoring'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Scoring' do
  describe 'score' do
    it 'correctly scores simple words' do
      Scrabble::Scoring.score('dog').must_equal 5
      Scrabble::Scoring.score('cat').must_equal 5
      Scrabble::Scoring.score('pig').must_equal 6
    end

    it 'adds 50 points for a 7-letter word' do
      Scrabble::Scoring.score('academy').must_equal 65
    end

    it 'handles all upper- and lower-case letters' do
      Scrabble::Scoring.score('dog').must_equal 5
      Scrabble::Scoring.score('DOG').must_equal 5
      Scrabble::Scoring.score('DoG').must_equal 5
    end

    it 'returns nil for strings containing bad characters' do
      Scrabble::Scoring.score('#$%^').must_be_nil
      Scrabble::Scoring.score('char^').must_be_nil
      Scrabble::Scoring.score(' ').must_be_nil
    end

    it 'returns nil for words > 7 letters' do
      Scrabble::Scoring.score('abcdefgh').must_be_nil
    end

    it 'returns nil for empty words' do
      Scrabble::Scoring.score('').must_be_nil
    end
  end

  describe 'highest_score_from' do
    it 'returns a string if an array of words is given' do
      array_of_words = ["dog", "cat", "horse"]
      Scrabble::Scoring.highest_score_from(array_of_words).must_be_kind_of String
    end

    it 'returns nil if no words are given' do
      array_of_words = []
      Scrabble::Scoring.highest_score_from(array_of_words).must_be_nil
    end

    it 'returns the word from an array with only one element' do
      array_of_words = ["dog"]
      Scrabble::Scoring.highest_score_from(array_of_words).must_equal "DOG"
    end

    it 'returns the highest scoring word from an array of words with different scores' do
      array_of_words = ["xi", "dog", "horse"]
      Scrabble::Scoring.highest_score_from(array_of_words).must_equal "XI"
    end

    it 'returns a 7-letter word (if present) from an array of words with tied scores' do
      array_of_words = ["QQQQQX","AEIOULD"]
      Scrabble::Scoring.highest_score_from(array_of_words).must_equal "AEIOULD"

      array_of_words = ["AEIOULD", "QQQQQX"]
      Scrabble::Scoring.highest_score_from(array_of_words).must_equal "AEIOULD"
    end

    it 'returns the shortest word from an array of words with tied scores (if no 7-letter word is present)' do
      array_of_words = ["BEEG", "BOB"]
      Scrabble::Scoring.highest_score_from(array_of_words).must_equal "BOB"

      array_of_words = ["BOB", "BEEG"]
      Scrabble::Scoring.highest_score_from(array_of_words).must_equal "BOB"
    end

    it 'returns the first word from an array of words of equal length and tied scores (if no 7-letter word is present)' do
      array_of_words = ["BOB", "BEC"]
      Scrabble::Scoring.highest_score_from(array_of_words).must_equal "BOB"

      array_of_words = ["BEC", "BOB"]
      Scrabble::Scoring.highest_score_from(array_of_words).must_equal "BEC"
    end
  end
end
