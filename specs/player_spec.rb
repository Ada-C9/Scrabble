require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative './player'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Player' do
  describe "#initialize" do
    it "Takes a name" do
      player = Scrabble::Player.new("Erika")

      player.must_respond_to :name
      player.name.must_equal "Erika"
      player.name.must_be_kind_of String
    end
  end

  describe 'plays' do
    it 'Returns an array of played words' do
      word = "dikla"
      user = Scrabble::Player.new(word)
      scrabble_word = user.plays
      scrabble_word.must_be_kind_of Array
    end
  end

  describe 'play' do
    it 'Adds the input word to the plays Array' do

      word = "nut"
      user = Scrabble::Player.new("bob")
      user.play(word)
      user.plays.must_include "nut"
      # Scrabble::Player.play(words).must_include "nut"
    end
    it 'Returns false if player has already won' do
      # Arrange
      user = Scrabble::Player.new("Fiona")
      5.times do
        user.play('zzzzzzz')
      end
      user.won?.must_equal true

      # Act
      result = user.play('test')

      # Assert
      result.must_equal false
    end
    it 'Returns the score of the word' do
      # Arrange
      user = Scrabble::Player.new("Fiona")
      # Act
      result = user.play("cat")
      # Assert
      result.must_equal 5
    end
<<<<<<< HEAD
    it 'Returns the sum of scores of played words' do
=======
    it "Returns the sum of scores of played words" do
>>>>>>> e73a893777d29f0b78c7fdba0a5760f269973e57
      # Arrange
      user = Scrabble::Player.new("Sam")
      result = 0
      words_arr = ["dog", "cat"]
      words_arr.each do |word|
      result += user.play(word)
      end
      # Act
      result += user.play("dog")
      # Assert
      result.must_equal 15
    end
  end

  describe 'won?' do
    it 'Returns true if the player has over 100 points' do
      user = Scrabble::Player.new("Delta")
      5.times do
        user.play('zzzzzzz')
      end

      user.won?.must_equal true
    end
    it 'Returns false if the player less over 100 points' do
      user = Scrabble::Player.new("Tide")
      3.times do
        user.play("dog")
      end
      user.won?.must_equal false
    end
  end

  describe 'highest_scoring_word' do
    it 'Returns the highest scoring played word' do
      user = Scrabble::Player.new("Amy")
      # words_arr = ["dog", "cat", "zebra"]
      user.play("dog")
      user.play("zebra")
      result = user.highest_scoring_word
      result.must_equal "zebra"

    end
  end

  describe 'highest_word_score' do
    it 'Returns the highest scoring word score' do
<<<<<<< HEAD
      user = Scrabble::Player.new("Kate")

=======
      user = Scrabble::Player.new("Amy")
>>>>>>> e73a893777d29f0b78c7fdba0a5760f269973e57
      user.play("dog")
      user.play("zebra")
      result = user.highest_word_score
      result.must_equal 16
    end
  end
<<<<<<< HEAD
=======

>>>>>>> e73a893777d29f0b78c7fdba0a5760f269973e57
end
