require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require 'pry'

require_relative '../lib/player'

# Get that nice colorized output
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Player' do

  describe 'initialize' do

    it 'correctly takes in a name and return the name' do
      name = "Hannah"
      player_1 = Scrabble::Player.new("Hannah")

      player_1.name.must_be_kind_of String
      player_1.name.must_equal name
    end

  end

  describe 'plays' do

    it 'correctly returns an array of the words played by the player' do
      word = "cat"
      player_1 = Scrabble::Player.new(word)
      scrabble_word = player_1.plays

      scrabble_word.must_be_kind_of Array
    end

  end

  describe 'play(word)' do

    it 'correctly adds the inputs words to the array in plays' do
      # arrange
      word = "dog"
      player_1 = Scrabble::Player.new("Hannah")

      # act
      player_1.play(word)

      # assert
      player_1.plays.must_equal ["dog"]
    end

    it 'correctly returns false if player has already won' do
      word_1 = "quetzal"
      word_2 = "elevens"
      word_3 = "zzzzzzz"
      player_1 = Scrabble::Player.new("Hannah")
      player_1.play(word_1)
      player_1.play(word_2)
      player_1.play(word_3)

      player_1.play(word_2).must_equal false
    end

  end

  describe 'total_score' do

    it "correctly returns the sum of scores of played words" do
      word_1 = "cat"
      word_2 = "dog"
      word_3 = "frog"
      word_4 = "house"
      player_1 = Scrabble::Player.new("Luxi")
      player_1.play(word_1)
      player_1.play(word_2)
      player_1.play(word_3)
      player_1.play(word_4)
      player_1.total_score.must_equal 26
    end

  end

  describe 'won?' do
    it "correctly returns true if the player has over 100 points, otherwise returns false" do
      word_1 = "quetzal"
      word_2 = "elevens"
      word_3 = "zzzzzzz"
      player_1 = Scrabble::Player.new("Hannah")
      player_1.play(word_1)
      player_1.play(word_2)
      player_1.play(word_3)
      player_1.won?.must_equal true
    end
  end

  describe 'highest_scoring_word' do
    it "Returns the highest scoring played word" do
      word_1 = "cat"
      word_2 = "dog"
      word_3 = "frog"
      player_1 = Scrabble::Player.new("Luxi")
      player_1.play(word_1)
      player_1.play(word_2)
      player_1.play(word_3)
      player_1.highest_scoring_word.must_equal "frog"
    end
  end #end of describe highest_scoring_word
end
