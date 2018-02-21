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
      test = Player.new("Wenjie")


      # Act
      result = test.plays
      # Assert
      result.must_be_kind_of Array
    end
  end

  xDescribe "Player#play(word)" do
    it "Adds the input word to the plays Array" do
      # Arrange
      words_played = ["thing", "stuff", "bug"]
      test = Player.new("Wenjie")


      # Act
      result = words_played.each do |word|
        test.play(word)
      end

      # Assert
      result.must_equal words_played

    end
    it "Returns false if player has already won" do

    end
    it "Returns the score of the word" do

    end
  end
# #total_score: Returns the sum of scores of played words
# #won?: If the player has over 100 points, returns true, otherwise returns false
# This should be a private method
# #highest_scoring_word: Returns the highest scoring played word
# #highest_word_score: Returns the highest_scoring_word score

end
