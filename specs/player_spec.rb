require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/player'

# Get that nice colorized output
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Player' do
  describe 'initialize' do
    it 'takes player name' do
      maja = Scrabble::Player.new("Maja")
      maja.must_respond_to :name
      maja.name.must_be_kind_of String

      maja.must_respond_to :won
      maja.won.must_equal false
    end
    it 'plays returns an array of words' do
      player = Scrabble::Player.new("maja")

      player.plays.must_be_instance_of Array
      player.plays.length.must_equal 0
    end
  end

  describe 'play method' do
    it 'takes a word and add it to an array' do
      brenda = Scrabble::Player.new("Brenda")

      brenda.play("line")
      brenda.play("fish")
      brenda.play("knife")
      brenda.play("cookie")

      brenda.plays.include? "knife"
    end
    it 'returns the score of a player' do
      john = Scrabble::Player.new("John")
      john.play('cookie').must_equal 12
    end
    it 'returns false if player already won' do
      john = Scrabble::Player.new("John")
      john.play("squeeze")
      john.play("jukebox")

      john.won.must_equal false
      # john.play.must_equal false
    end
  end

  describe 'total_score method' do
    it 'returns the total_score for a player' do
      sarah = Scrabble::Player.new("sarah")
      sarah.play('cookie')
      sarah.play('key')
      sarah.play('fish')
      sarah.total_score.must_equal 32
    end
  end

  describe 'highest_scoring word' do
    it 'returns the highest scoring word' do
      sarah = Scrabble::Player.new("sarah")
      sarah.play('cookie')
      sarah.play('cake')
      sarah.play('alcohol')
      sarah.highest_scoring_word.must_equal 'alcohol'
    end

    it 'returns a string' do
      sarah = Scrabble::Player.new("sarah")
      sarah.play('cookie')
      sarah.play('cake')
      sarah.play('alcohol')
      sarah.highest_scoring_word.must_be_instance_of String
    end
  end

  describe 'highest_word_score' do
    it 'returns the highest scoring word score' do
      sarah = Scrabble::Player.new("sarah")
      sarah.play('cookie')
      sarah.play('cake')
      sarah.play('alcohol')

      sarah.highest_word_score.must_equal 62
    end
  end

  describe 'won method' do
    it 'returns true if score is > 100' do
      john = Scrabble::Player.new("John")
      john.play("squeeze")
      john.play("jukebox")

      john.won?.must_equal true
    end

    it 'returns false if score is < 100' do
      john = Scrabble::Player.new("John")
      john.play("word")
      john.play("score")

      john.won?.must_equal false
    end
  end
end
