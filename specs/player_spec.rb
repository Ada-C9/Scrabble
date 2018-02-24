require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/player'

# Get that nice colorized output
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Player' do
  describe 'name' do
    it 'returns the value of the @name instance variable' do
      ada = Scrabble::Player.new("Ada")
      ada.name.must_equal "Ada"
    end
  end #ends describe 'name' do

  describe 'plays' do
    it 'returns an Array of the words played by the player' do
      ada = Scrabble::Player.new("Ada")
      # ada.name.must_equal "Ada"
      ada.play("apple")
      ada.play("cat")
      ada.plays.must_equal(["apple", "cat"])
    end
  end #ends describe 'plays' do

  describe 'play(word)' do
    it 'adds the input word to the plays array' do
      ada = Scrabble::Player.new("Ada")
      ada.play("apple")
      ada.plays.must_include("apple")
    end

    it 'prevents a player who has won from playing' do
      # write test method to return true or false
      # Arrange scenario where a player reaches more than 100
      ada = Scrabble::Player.new("Ada")
      ada.play("apple")
      ada.play("kale")
      ada.play("cashew")
      ada.play("banana")
      ada.play("tomato")
      ada.play("avocado")
      ada.play("cat").must_equal(false)
    end

    it "returns the score of the word that is played if the player hasn't won" do
      ada = Scrabble::Player.new("Ada")
      ada.play("apple").must_equal(9)
    end

    it "if you already won it doesn't add word to array" do
      ada = Scrabble::Player.new("Ada")
      ada.play("apple")
      ada.play("kale")
      ada.play("cashew")
      ada.play("banana")
      ada.play("tomato")
      ada.play("avocado")
      ada.play("cat").must_equal false
    end

    it "updates the total score after playing word" do
      ada = Scrabble::Player.new("Ada")
      ada.play("beets")
      puts ada.total_score
    end
  end #ends describe 'play(word)'


end #ends Player do
