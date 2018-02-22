require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/scoring'
require 'pry'

# Get that nice colorized output
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

xdescribe 'Scoring' do
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
    it 'returns nil if no words were passed' do
      Scrabble::Scoring.highest_score_from([]).must_be_nil
    end

    it 'returns the only word in a length-1 array' do
      Scrabble::Scoring.highest_score_from(["word"]).must_equal "word"
    end

    it 'returns the highest word if there are two words' do
      Scrabble::Scoring.highest_score_from(["Nicole", "Zheng"]).must_equal "Zheng"
    end

    it 'if tied, prefer a word with 7 letters' do
      Scrabble::Scoring.highest_score_from(["ZZZZZZ", "AAAAADB"]).must_equal "AAAAADB"
      Scrabble::Scoring.highest_score_from(["AAAAADB", "ZZZZZZ"]).must_equal "AAAAADB"
    end

    it 'if tied and no word has 7 letters, prefers the word with fewer letters' do
      Scrabble::Scoring.highest_score_from(["Zheg", "Zicole"]).must_equal "Zheg"
      Scrabble::Scoring.highest_score_from(["Zicole", "Zheg"]).must_equal "Zheg"
    end

    it 'returns the first word of a tie with same letter count' do
      Scrabble::Scoring.highest_score_from(["aeiou", "lnrst"]).must_equal "aeiou"
      Scrabble::Scoring.highest_score_from(["lnrst", "aeiou"]).must_equal "lnrst"
    end

    # A new test for edge case
    it 'returns the first word of a tie with 7 letter count' do
      Scrabble::Scoring.highest_score_from(["ZZZZZZZ", "QQQQQQQ"]).must_equal "ZZZZZZZ"
      Scrabble::Scoring.highest_score_from(["QQQQQQQ", "ZZZZZZZ"]).must_equal "QQQQQQQ"
    end
  end
end
