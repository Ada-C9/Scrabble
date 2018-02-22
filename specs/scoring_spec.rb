require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/scoring'

# Get that nice colorized output
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
    it 'returns nil if no words were passed' do
      Scrabble::Scoring.highest_score_from([]).must_be_nil
    end

    it 'returns the only word in a length 1 array' do
      words1 = ["cookie"]
      Scrabble::Scoring.highest_score_from(words1).must_equal "cookie"
    end

    it 'returns the highest value word if there are two words' do
      words2 = ["cookie", "cake"]
      Scrabble::Scoring.highest_score_from(words2).must_equal "cookie"
    end

    it 'if tied, prefer a word with 7 letters' do

      words3 = ["alcohol", "fish", "canoli", "knife"]

      Scrabble::Scoring.highest_score_from(words3).must_equal "alcohol"
    end

    xit 'if tied and no word has 7 letters, prefers the word with fewer letters' do
      words4 = ["cookie", "pink", "canoli", "knife"]
      Scrabble::Scoring.highest_score_from(words4).must_equal "knife"
    end

    xit 'returns the first word of a tie with same letter count' do
      words = ["yellow", "bomb", "canoli", "cookie"]
      Scrabble::Scoring.highest_score_from(words).must_equal "yellow"
    end
  end
end
