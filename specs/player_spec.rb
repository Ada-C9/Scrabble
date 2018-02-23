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
      test = Scrabble::Player.new(name)

      # Assert
      test.name.must_equal "Wenjie"
    end
  end
  describe 'Player#play' do
    it 'returns an Array of the words played by the player' do
      # Arrange
      test = Scrabble::Player.new("Wenjie")

      # Act
      result = test.plays

      # Assert
      result.must_be_kind_of Array
    end
  end

  # describe "Player#play(word)" do
  #   it "Adds the input word to the plays Array" do
  #     # Arrange
  #     test = Scrabble::Player.new("Wenjie")
  #     test.tiles = %W[T H I N G S T]
  #     test.play("thing")
  #     test.tiles = %W[S T U F F B U]
  #     test.play("stuff")
  #     test.tiles = %W[B U C O C O G]
  #
  #     new_word = "coco"
  #     test.play(new_word)
  #
  #     # Act
  #     result = test.plays.include?(new_word)
  #
  #     # Assert
  #     result.must_equal true
  #
  #   end

  it "Returns false when user use letter not on hand " do
    # Arrange
    test = Scrabble::Player.new("Wenjie")
    test.tiles = [:A, :B, :C, :O, :C, :F, :G]
    new_word = "cojh"

    # Act
    result = test.play(new_word)
    # Assert
    result.must_equal false

  end



  it "Returns false if player has already won" do
    # Arrange
    new_word = "bug"
    test = Scrabble::Player.new("Wenjie")
    plays = ["flitter", "quicken", "snowed"]

    # Act

    plays.each { |word| test.play(word)}
    result = test.play(new_word)

    # Assert
    result.must_equal false
  end

  it "Returns the score of the word" do
    # Arrange
    new_word = "coco"
    test = Scrabble::Player.new("Wenjie")
    test.tiles = [:C, :O, :O, :C, :L, :I, :T]

    # Act
    result = test.play(new_word)

    # Assert
    result.must_equal 8
  end
end


describe "#total_score" do
  it "Returns the sum of scores of played words" do
    #Arrange
    word_1 = "snow"
    word_2 = "litter"
    test = Scrabble::Player.new("Wenjie")

    # Act
    test.tiles = [:S, :N, :O, :W, :L, :I, :T]
    test.play(word_1)
    test.tiles = [:L, :I, :T, :T, :E, :R, :O]
    test.play(word_2)

    # Assertion
    test.total_score.must_equal 13
  end
end

describe "#won?" do

  it "If the player has over 100 points, returns true, otherwise returns false" do
    #This should be a private method
    # Arrange
    test = Scrabble::Player.new("Wenjie")
    test.tiles = [:F, :L, :I, :T, :T, :R, :E]
    test.play("flitter")
    test.tiles = [:Q, :U, :I, :C, :K, :N, :E]
    test.play("quicken")

    # Assert
    test.won?.must_equal true
  end
end

describe "#highest_scoring_word" do
  it "Returns the highest scoring played word" do
    # Arrange
    test = Scrabble::Player.new("Wenjie")

    test.tiles = [:D, :O, :G, :C, :A, :M, :E]
    test.play("dog")

    test.tiles = [:C, :A, :M, :E, :L, :F, :L]
    test.play("camel")

    test.tiles = [:F, :L, :I, :T, :T, :E, :R]
    test.play("flitter")

    # Act
    result = test.highest_scoring_word

    # Assert
    result.must_equal "flitter"
  end
end

describe "#highest_word_score" do
  it "Returns the highest_scoring_word score" do
    # Arrange
    test = Scrabble::Player.new("Wenjie")
    play = ["dog", "camel", "flitter"]

    # Act
    play.each { |word| test.play(word) }
    result = test.highest_word_score

    # Assert
    result.must_equal 60
  end
end
