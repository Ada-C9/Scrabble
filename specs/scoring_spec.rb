require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/scoring'

# Get that nice colorized output
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Scoring' do

  xdescribe 'score' do
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

    xit 'returns nil if no words were passed' do
      #arrange
      words = []
      #act & #assert
     Scrabble::Scoring.highest_score_from(words).must_be_nil

    end

    xit 'returns the only word in a length-1 array' do
      words = []
      words << "pearl"
      Scrabble::Scoring.highest_score_from(words).must_equal "pearl"
    end

    xit 'returns the highest word if there are two words' do
      words = []
      words.push("zebra", "otter")

      Scrabble::Scoring.highest_score_from(words).must_equal "zebra"
    end

    xit 'if tied, prefer a word with 7 letters' do
      words = []
      words.push("mum", "agenda")

      Scrabble::Scoring.highest_score_from(words).must_equal "agenda"
    end

    xit 'if tied and no word has 7 letters, prefers the word with fewer letters' do
      words = []
      words.push("long", "dig")
      puts words.join(",")

      Scrabble::Scoring.highest_score_from(words).must_equal "dig"
    end

    xit 'returns the first word of a tie with same letter (count)' do
    end
  end
end
