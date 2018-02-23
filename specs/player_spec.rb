require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/player'
describe 'Player' do
  describe 'Player#name' do
    it 'returns the value of the @name instance variable' do
      # Arrange
      name = "Wenjie"
      # Act
      the_test = Scrabble::Player.new(name)
      # Assert
      the_test.name.must_equal "Wenjie"
    end
  end

  describe 'Player#play' do
    it 'returns an Array of the words played by the player' do
      # Arrange
      the_test = Scrabble::Player.new("Wenjie")
      # Act
      result = the_test.plays
      # Assert
      result.must_be_kind_of Array
    end
  end

  describe "Player#play(word)" do
    it "Adds the input word to the plays Array" do
      # Arrange
      the_test = Scrabble::Player.new("Wenjie")
      the_test.tiles = [:T, :H, :I, :N, :G, :S, :T]
      the_test.play("thing")
      the_test.tiles = [:S, :T, :U, :F, :F, :B, :U]
      the_test.play("stuff")
      the_test.tiles = [:B, :U, :C, :O, :C, :O, :G]
      new_word = "coco"
      the_test.play(new_word)

      # Act
      result = the_test.plays.include?(new_word)

      # Assert
      result.must_equal true
    end

    it "Returns false when user use letter not on hand " do
      # Arrange
      the_test = Scrabble::Player.new("Wenjie")
      the_test.tiles = [:A, :B, :C, :O, :C, :F, :G]
      new_word = "cojh"

      # Act
      result = the_test.play(new_word)

      # Assert
      result.must_equal false
    end

    # Edge case
    it "Returns false when user's word has more than letters on hand " do
      # Arrange
      the_test = Scrabble::Player.new("Wenjie")
      the_test.tiles = [:C, :O, :A, :O, :V, :F, :G]
      new_word = "coco"

      # Act
      result = the_test.play(new_word)

      # Assert
      result.must_equal false
    end

    it "Returns false if player has already won" do
      # Arrange
      new_word = "bug"
      the_test = Scrabble::Player.new("Wenjie")
      the_test.tiles = [:F, :L, :I, :T, :T, :E, :R]
      the_test.play("flitter")

      the_test.tiles = [:Q, :U, :I, :C, :K, :E, :N]
      the_test.play("quicken")

      the_test.tiles = [:S, :N, :O, :W, :E, :D, :G]
      new_word = "snowed"

      # Act
      result = the_test.play(new_word)

      # Assert
      result.must_equal false
    end

    it "Returns the score of the word" do
      # Arrange
      new_word = "coco"
      the_test = Scrabble::Player.new("Wenjie")
      the_test.tiles = [:C, :O, :O, :C, :L, :I, :T]

      # Act
      result = the_test.play(new_word)

      # Assert
      result.must_equal 8
    end
  end


  describe "#total_score" do
    it "Returns the sum of scores of played words" do
      #Arrange
      word_1 = "snow"
      word_2 = "litter"
      the_test = Scrabble::Player.new("Wenjie")

      # Act
      the_test.tiles = [:S, :N, :O, :W, :L, :I, :T]
      the_test.play(word_1)

      the_test.tiles = [:L, :I, :T, :T, :E, :R, :O]
      the_test.play(word_2)

      # Assertion
      the_test.total_score.must_equal 13
    end
  end

  describe "#won?" do

    it "If the player has over 100 points, returns true, otherwise returns false" do
      #This should be a private method
      # Arrange
      the_test = Scrabble::Player.new("Wenjie")
      the_test.tiles = [:F, :L, :I, :T, :T, :R, :E]
      the_test.play("flitter")

      the_test.tiles = [:Q, :U, :I, :C, :K, :N, :E]
      the_test.play("quicken")

      # Assert
      the_test.won?.must_equal true
    end
  end

  describe "#highest_scoring_word" do
    it "Returns the highest scoring played word" do
      # Arrange
      the_test = Scrabble::Player.new("Wenjie")

      the_test.tiles = [:D, :O, :G, :C, :A, :M, :E]
      the_test.play("dog")

      the_test.tiles = [:C, :A, :M, :E, :L, :F, :L]
      the_test.play("camel")

      the_test.tiles = [:F, :L, :I, :T, :T, :E, :R]
      the_test.play("flitter")

      # Act
      result = the_test.highest_scoring_word

      # Assert
      result.must_equal "flitter"
    end
  end

  describe "#highest_word_score" do
    it "Returns the highest_scoring_word score" do
      # Arrange
      the_test = Scrabble::Player.new("Wenjie")

      the_test.tiles = [:D, :O, :G, :C, :A, :M, :E]
      the_test.play("dog")

      the_test.tiles = [:C, :A, :M, :E, :L, :F, :L]
      the_test.play("camel")

      the_test.tiles = [:F, :L, :I, :T, :T, :E, :R]
      the_test.play("flitter")
      # Act
      result = the_test.highest_word_score

      # Assert
      result.must_equal 60
    end
  end

end
