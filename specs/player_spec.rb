require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/player'

# Get that nice colorized output
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Player' do
  player = Scrabble::Player.new("Player")

  describe '#name' do

    it 'returns the instance variable name for instance of Player' do
      angie = Scrabble::Player.new("Angie")
      angie.must_respond_to :name
      angie.name.must_equal "Angie"
    end

  end # describe name

  describe '#plays' do

    it "returns an Array of the words played by the player" do
      player.play("first")
      player.play("second")
      result = player.plays
      result.must_be_kind_of Array
      result.must_equal ["first", "second"]
    end

    it "returns an an empty Array if no words have been played" do
      result = player.plays
      result.must_be_kind_of Array
      result.must_equal []
    end

  end # describe plays

  describe '#play(word)' do

    it "adds the input word to the plays Array" do
      player.play("academy")
      result = player.plays
      result.must_equal ["academy"]
    end

    it "returns false if player has already won" do
      player.play("qqqq") # 40
      player.play("zzzz") # 40
      player.play("qzqz") # 40
      result = player.play("whatever")
      result.must_equal false
    end

    it "returns the score of the word" do
      result = player.play("qqqq")
      result.must_equal 40
    end

  end # describe play(word)

  describe '#total_score' do

    it "returns the sum of scores of played words" do
      player.play("qqqq") # 40
      player.play("zzzz") # 40
      result = player.total_score
      result.must_equal 80
    end

    it "returns 0 if no words have been played" do
      result = player.total_score
      result.must_equal 0
    end

  end # describe total_score

  xdescribe '#won?' do

    it "returns true if the player has over 100 points" do

    end

    it "returns false if the player does not have over 100 points" do

    end

  end # describe won?

  xdescribe '#highest_scoring_word' do

    it "returns the highest scoring played word" do

    end

  end # describe highest_scoring_word

  xdescribe '#highest_word_score' do

    it "returns the score for the highest scoring word" do

    end

  end # describe highest_word_score


end # describe Player
