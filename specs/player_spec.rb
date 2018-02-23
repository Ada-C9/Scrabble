require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/player'
require_relative '../lib/scoring'
require_relative '../lib/tilebag'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Player' do
  describe 'initialize' do
    it "new player is an instance of class Player" do
      Scrabble::Player.new("Ana").must_be_instance_of Scrabble::Player
    end

    it "player name is a kind of string" do
      Scrabble::Player.new("Ana").name.must_be_kind_of String
    end

    it "player begins with no tiles, no words played, and a score of zero" do
      player_1 = Scrabble::Player.new("Ana")

      player_1.words_played.must_equal []
      player_1.tiles.must_equal []
      player_1.score.must_equal 0
    end
  end

  describe 'plays' do
    it "returns an array" do
      player_1 = Scrabble::Player.new("Wini")

      player_1.plays.must_be_kind_of Array
    end

    it "returns an array of words played" do
      player_1 = Scrabble::Player.new("Wini")
      player_1.play("hello")
      player_1.play("hi")

      player_1.plays.must_equal ["HELLO", "HI"]
    end
  end

  describe 'play' do
    it "adds the played word to the array of words played" do
      player_1 = Scrabble::Player.new("Dan")
      player_1.play("xx")

      player_1.words_played.must_include "XX"
    end

    it "returns the score of the word if the game is not won" do
      player_1 = Scrabble::Player.new("Dan")

      player_1.play("xx").must_equal 16
    end

    it 'returns false if the game is won' do
      player_1 = Scrabble::Player.new("Dan")

      player_1.play("zzzzffd").must_equal 100
      player_1.play("xx").must_equal false
    end
  end

  describe "total score" do
    it "returns the the summed scores of player's words" do
      player_1 = Scrabble::Player.new("Dan")
      player_1.play("hello")
      player_1.play("hi")
      player_1.play("hey")

      player_1.total_score.must_equal 22
    end
  end

  describe "won?" do
    it "returns true if total score is more than 100" do
      player_1 = Scrabble::Player.new("Dan")
      player_1.play("zzzzzzz")

      player_1.won?.must_equal true
    end

    it "returns false if total score is equal to 100" do
      player_1 = Scrabble::Player.new("Dan")
      player_1.play("zzzzffd")

      player_1.won?.must_equal false
    end

    it "returns false if total score is less than 100" do
      player_1 = Scrabble::Player.new("Dan")
      player_1.play("bob")

      player_1.won?.must_equal false
    end
  end

  describe "highest_scoring_word" do
    it "returns a string" do
      player_1 = Scrabble::Player.new("Dan")
      player_1.play("hello")

      player_1.highest_scoring_word.must_be_kind_of String
    end

    it "returns the highest scoring word played by each player" do
      player_1 = Scrabble::Player.new("Dan")
      player_2 = Scrabble::Player.new("Dee")
      player_1.play("hello")
      player_1.play("hi")
      player_2.play("hey")
      player_2.play("hallo")

      player_1.highest_scoring_word.must_equal "HELLO"
      player_2.highest_scoring_word.must_equal "HEY"
    end
  end

  describe "highest_word_score" do
    it "returns an integer" do
      player_1 = Scrabble::Player.new("Dan")
      player_1.play("hello")

      player_1.highest_word_score.must_be_kind_of Integer
    end

    it "returns the score of the highest scoring word" do
      player_1 = Scrabble::Player.new("Dan")
      player_1.play("hello")
      player_1.play("hi")
      player_1.play("hey")

      player_1.highest_word_score.must_equal 9
    end
  end

  describe "tiles" do
    it "returns an array" do
      player_1 = Scrabble::Player.new("Dan")
      player_1.tiles.must_be_kind_of Array
    end

    it "player cannot have more than seven tiles" do
      player_1 = Scrabble::Player.new("Dan")
      player_1.tiles.length.must_be :<=, 7
    end
  end

  describe "draw_tiles" do
    it "draws seven tiles after the player is initialized" do
      game_tiles = Scrabble::Tilebag.new
      player_1 = Scrabble::Player.new("Dan")
      player_1.draw_tiles(game_tiles).length.must_equal 7
      player_1.tiles.length.must_equal 7
    end

    it "draws the correct number of tiles after a word is played" do
      game_tiles = Scrabble::Tilebag.new
      player_1 = Scrabble::Player.new("Dan")
      player_1.draw_tiles(game_tiles)
      player_1.play(player_1.tiles[0])
      player_1.draw_tiles(game_tiles).length.must_equal 1
      player_1.play(player_1.tiles.join)
      player_1.draw_tiles(game_tiles).length.must_equal 7
    end
  end
end
