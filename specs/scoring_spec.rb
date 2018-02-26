# Kaitlin Forsman and Kirsten Schumy
# Ada Cohort[9], Ampers
# Scrabble Assignment

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

    it 'throw ArgumentError for non-string inputs' do
      proc { Scrabble::Scoring.score([]) }.must_raise ArgumentError
      proc { Scrabble::Scoring.score(nil) }.must_raise ArgumentError
    end

    it 'throw ArgumentError inputs that non-alphabet characters' do
      proc { Scrabble::Scoring.score('c4ts') }.must_raise ArgumentError
      proc { Scrabble::Scoring.score('#$%^') }.must_raise ArgumentError
      proc { Scrabble::Scoring.score('char^') }.must_raise ArgumentError
    end

    it 'throw ArgumentError for words > 7 letters' do
      proc { Scrabble::Scoring.score('academies') }.must_raise ArgumentError
    end

    it 'throw ArgumentError for empty words' do
      proc { Scrabble::Scoring.score('') }.must_raise ArgumentError
      proc { Scrabble::Scoring.score('     ') }.must_raise ArgumentError
    end
  end

  describe 'highest_score_from' do
    it 'returns nil if no words were passed' do
      proc { Scrabble::Scoring.highest_score_from([]) }.must_raise ArgumentError
    end

    it 'returns nil if provided non-array input' do
      proc { Scrabble::Scoring.highest_score_from(nil)}.must_raise ArgumentError
    end

    it 'returns nil if element in provided array is not a String' do
      proc { Scrabble::Scoring.highest_score_from(["foo", 4, "bar"]) }.must_raise ArgumentError
    end

    it 'returns the only word in a length-1 array' do
      Scrabble::Scoring.highest_score_from(["unicorn"]).must_equal "unicorn"
    end

    it 'returns the highest word if there are two words' do
      Scrabble::Scoring.highest_score_from(["unicorn", "boo"]).must_equal "unicorn"
    end

    it 'if tied, prefer a word with 7 letters' do
      Scrabble::Scoring.highest_score_from(["QQQQQQ", "BEAIOUD"]).must_equal "BEAIOUD"
    end

    it 'if tied and no word has 7 letters, prefers the word with fewer letters' do
        Scrabble::Scoring.highest_score_from(["QQ", "QKK"]).must_equal "QQ"
        Scrabble::Scoring.highest_score_from(["QKK", "QQ"]).must_equal "QQ"
    end

    it 'returns the first word of a tie with same letter count' do
      Scrabble::Scoring.highest_score_from(["QQQ", "ZZZ"]).must_equal "QQQ"
      Scrabble::Scoring.highest_score_from(["ZZZ", "QQQ"]).must_equal "ZZZ"
    end
  end
end
