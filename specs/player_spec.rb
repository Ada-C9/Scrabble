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

  describe "Player#play(word)" do
    it "Adds the input word to the plays Array" do
      # Arrange
      new_word = "coco"
      test = Scrabble::Player.new("Wenjie")
      plays = ["thing", "stuff", "bug"]

      words_played = plays.each do |word|
        test.play(word)
      end

      test.play(new_word)

      # Act
      result = test.plays.include?(new_word)

      # Assert
      result.must_equal true

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
      test.plays = ["thing", "stuff", "bug"]

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
      test.play(word_1)
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
      test.play("flitter")

      # Act
      result = test.play("quicken")

      # Assert
      test.won?.must_equal true
    end
  end
  describe "#highest_scoring_word" do
    it "Returns the highest scoring played word" do

    end
  end
  describe "#highest_word_score" do
    it "Returns the highest_scoring_word score" do

    end
  end
end
