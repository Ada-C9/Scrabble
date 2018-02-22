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
    it "returns an an empty Array if no words have been played" do
      player_six = Scrabble::Player.new("player_six")
      result = player_six.plays
      result.must_be_kind_of Array
      result.must_equal []
    end

    it "returns an Array of the words played by the player" do
      player_eight = Scrabble::Player.new("player_eight")
      player_eight.play("first")
      player_eight.play("second")
      result = player_eight.plays
      result.must_be_kind_of Array
      result.must_equal ["first", "second"]
    end


  end # describe plays

  describe '#play(word)' do

    it "adds the input word to the plays Array" do
      player_two = Scrabble::Player.new("player_two")
      player_two.play("academy")
      result = player_two.plays
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
      player_five = Scrabble::Player.new("player_five")
      result = player_five.play("qqqq")
      result.must_equal 40
    end

  end # describe play(word)

  describe '#total_score' do

    it "returns the sum of scores of played words" do
      player_three = Scrabble::Player.new("player_three")
      player_three.play("qqqq") # 40
      player_three.play("zzzz") # 40
      result = player_three.total_score
      result.must_equal 80
    end

    it "returns 0 if no words have been played" do
      player_four = Scrabble::Player.new("player_four")
      result = player_four.total_score
      result.must_equal 0
    end

  end # describe total_score

  describe '#won?' do


    player_seven = Scrabble::Player.new("player_seven")
    it "returns false if the player does not have over 100 points" do
      player_seven.play("qqqqq")
      player_seven.play("zzzzz")
      player_seven.won?.must_equal false

    end
    it "returns true if the player has over 100 points" do
      player_seven.play("a")
      player_seven.won?.must_equal true
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
