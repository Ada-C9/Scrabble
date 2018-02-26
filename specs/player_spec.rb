require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/player'
require_relative '../lib/tile_bag'

Minitest::Reporters.use!
Minitest::Reporters::SpecReporter.new

describe 'Player' do
  describe "#initialize" do
    it "Takes a Player name" do
      player_1 = Scrabble::Player.new("Patrick")
      player_1.must_be_instance_of Scrabble::Player

      player_1.must_respond_to :name
      player_1.name.must_equal "Patrick"
      player_1.name.must_be_kind_of String

    end
    describe "#plays" do
      it "Returns an array of words played:" do
        player_1 = Scrabble::Player.new("Patrick")

        player_1.plays.must_be_kind_of Array

      end
    end

    describe "#play(word)" do
      it "Adds input word to @plays array." do
        player_1 = Scrabble::Player.new("Patrick")
        player_1.play("orange")

        player_1.plays.must_include "orange"

      end

      it "Returns false if player already won" do
        player_1 = Scrabble::Player.new("Patrick")
        player_1.play("xxxxxxx")

        player_1.play("orange").must_equal false
      end
    end
  end

  describe '#total_score' do
    it " Returns the sum of scores of played words" do
      player_1 = Scrabble::Player.new("Patrick")
      player_1.play("apples")
      player_1.play("fuzzy")

      player_1.total_score.must_equal 39
    end
  end

  describe '#won?' do
    it "Returns true if player has over 100 points" do
      player_1 = Scrabble::Player.new("Patrick")
      player_1.play("xxxxxxx")
      player_1.won?.must_equal true

    end

    it "Returns false if player has over 100 points" do
      player_1 = Scrabble::Player.new("Patrick")
      player_1.play("apples")
      player_1.play("fuzzy")
      player_1.won?.must_equal false

    end
  end

  describe '#highest_scoring_word' do
    it 'Returns the highest scoring played word' do
      player_1 = Scrabble::Player.new("Patrick")
      player_1.play("cat")
      player_1.play("pig")

      player_1.highest_scoring_word.must_equal "pig"
      player_1.highest_scoring_word.must_be_kind_of String

    end


    it 'Returns the first word if there is a tie between hightest scoring words"' do
      player_1 = Scrabble::Player.new("Patrick")
      player_1.play("ba")
      player_1.play("dd")

      player_1.highest_scoring_word.must_equal "ba"

    end

  end

  describe '#highest_word_score' do
    it 'Returns the score of the highest scoring word' do
      player_1 = Scrabble::Player.new("Patrick")
      player_1.play("cat")
      player_1.play("pig")

      player_1.highest_word_score.must_equal 6

    end
  end

  describe 'draw_tiles(tile_bag)' do
    it 'is a collection of letters that the player can play (max 7)' do
      player_1 = Scrabble::Player.new("Patrick")
      tile_bag = Scrabble::TileBag.new

      players_tiles = player_1.draw_tiles(tile_bag)

      players_tiles.must_be_kind_of Array
      all_letters = players_tiles.all? { |word| word.class == String }
      all_letters.must_equal true
    end

  end

  it 'fills tiles array until it has 7 letters from the given tile bag' do
    player_1 = Scrabble::Player.new("Patrick")
    tile_bag = Scrabble::TileBag.new

    players_tiles = player_1.draw_tiles(tile_bag)
    players_tiles.length.must_equal 7

  end
end
