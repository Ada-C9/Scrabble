require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/player'

# Get that nice colorized output
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Player' do
  describe 'name' do
    it 'returns the value of the @name instance variable' do
      Scrabble::Player.name("Ada").must_equal "Ada"
    end
  end #ends describe 'name' do

  describe 'plays' do
    it 'returns an Array of the words played by the player' do
      Scrabble::Player.play("apple")
      Scrabble::Player.play("cat")
      Scrabble::Player.plays.must_equal(["apple", "cat"])
    end
  end #ends describe 'plays' do

  # describe 'play(word)'
  #   it 'adds the input word to the plays array' do
  #     Scrabble::Player.play("apple")
  #     Scrabble::Player.plays.must_include("apple")
  #   end
  #
  #   # it 'prevents a player who has won from playing' do
  #   #   Scrabble::Player.won? = true
  #   #   Scrabble::Player.play("apple").must_equal(false)
  #   # end
  #
  #   # it "returns the score of the word that is played if the player hasn't won" do
  #   #   Scrabble::Player.won? = false
  #   #   Scrabble::Player.play("apple").must_equal(9)
  #   # end
  # end #ends describe 'play(word)'

  describe 'total_score'
    it 'returns the sum of scores of played words' do
      Scrabble::Player.play("apple")
      Scrabble::Player.play("cat")
      Scrabble::Player.total_score.must_equal(14)
    end
  end #ends describe 'total score'

  describe 'won?' do
    it 'returns true if the player has over 100 points' do
      Scrabble::Player.total_score = 101
      Scrabble::Player.won?.must_equal(true)
    end

    it 'returns false if the player has less than 101 points' do
      Scrabble::Player.total_score = 99
      Scrabble::Player.won?.must_equal(false)
    end
  end #ends describe 'won?' do

  describe 'highest_scoring_word' do
    it 'returns the highest scoring played word' do
      Scrabble::Player.play("apple")
      Scrabble::Player.play("cat")
      Scrabble::Player.highest_scoring_word.must_equal("apple")
    end
  end

  describe 'highest_word_score' do
    it 'returns the highest_scoring_word score number' do
      Scrabble::Player.play("apple")
      Scrabble::Player.play("cat")
      Scrabble::Player.highest_word_score.must_equal(9)
    end #ends it block
  end #ends describe highest word score

end #ends class block
