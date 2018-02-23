require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/player'

# Get that nice colorized output
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Player' do
  describe 'new' do
    it 'returns the value of the @name instance variable' do
      jim = Scrabble::Player.new("Jim")
      jim.name.must_equal "Jim"
    end

    it 'returns an Array of the words played by the player' do
      jim = Scrabble::Player.new("Jim")

      jim.plays.must_be_instance_of Array
    end

    it "adds the input word to the plays Array"  do
      jim = Scrabble::Player.new("Jim")

      plays = ["cat", "man", "trees"]
      plays.each do |word|
        jim.play(word)
      end

      jim.plays.must_equal plays
      # jim.plays.must_equal plays
      #   word = ["milk","tide","cat"]
      #   word.each do |w|
      #   plays.push(word)
    end

    it 'returns nil for strings containing bad characters' do
      jim = Scrabble::Player.new("Jim")

      jim.play('#$%^').must_be_nil
      jim.play('char^').must_be_nil
      jim.play(' ').must_be_nil
    end

    it 'returns nil for words > 7 letters' do
      jim = Scrabble::Player.new("Jim")

      jim.play('supercalifragilisticexpialadocious').must_be_nil
    end

    it 'returns nil for empty words' do
      jim = Scrabble::Player.new("Jim")

      jim.play('').must_be_nil
    end
  end
#
#   xdescribe 'highest_score_from' do
#     it 'returns nil if no words were passed' do
#       # Act
#       word_collection = []
#       # Assert
#       Scrabble::Player.highest_score_from(word_collection).must_be_nil
#     end
#
#     it 'returns the only word in a length-1 array' do
#       # Act
#       word_collection = ["dog"]
#       word_collection2 = ["mouse"]
#       # Assert
#       Scrabble::Player.highest_score_from(word_collection).must_equal "dog"
#       Scrabble::Player.highest_score_from(word_collection2).must_equal "mouse"
#     end
#
#     it 'returns the highest word if there are two words' do
#       word_collection = ["dog","quiz","cat"]
#       Scrabble::Player.highest_score_from(word_collection).must_equal "quiz"
#     end
#
#     it 'if tied, prefer a word with 7 letters' do
#       #Act
#         word_collection = ['kkb','markets','qm']
#         word_collection2 = ["dogss", "treatss"]
#       #Assert
#       Scrabble::Player.highest_score_from(word_collection).must_equal "markets"
#       Scrabble::Player.highest_score_from(word_collection2).must_equal "treatss"
#
#     end
#
#     it 'if tied and no word has 7 letters, prefers the word with fewer letters' do
#       words = ["kf","bcm", "dgmae"]
#       words2 = "kk", "q", "aeiouk"
#       Scrabble::Player.highest_score_from(words).must_equal "kf"
#       Scrabble::Player.highest_score_from(words2).must_equal "q"
#     end
#
#     it 'returns the first word of a tie with same letter count' do
#       words = ["kf","bcm", "kh", "dgmae","kw"]
#       Scrabble::Player.highest_score_from(words).must_equal "kf"
#
#       words = ["bcm", "kh", "dgmae","kf"]
#       Scrabble::Player.highest_score_from(words).must_equal "kh"
#     end
#   end
#  end
 end
