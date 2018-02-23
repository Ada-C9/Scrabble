require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/tilebag'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe "Tilebag" do
  describe "initialize" do
    it "is an instance of class Tilebag" do
      Scrabble::Tilebag.new.must_be_instance_of Scrabble::Tilebag
    end

    it "creates an array of tiles" do
      new_game = Scrabble::Tilebag.new
      new_game.tilebag.must_be_kind_of Array
    end

    it "has 98 tiles initially" do
      new_game = Scrabble::Tilebag.new
      new_game.tilebag.length.must_equal 98
    end

    it "includes six N tiles" do
      new_game = Scrabble::Tilebag.new
      new_game.tilebag.select{ |tile| tile == "N" }.length.must_equal 6
    end

    it "includes 1 Q tile" do
      new_game = Scrabble::Tilebag.new
      new_game.tilebag.select{ |tile| tile == "Q" }.length.must_equal 1
    end
  end

  describe "draw_tiles" do
    it "returns an array of drawn tiles" do
      game_tiles = Scrabble::Tilebag.new
      game_tiles.draw_tiles(7).must_be_kind_of Array
    end

    it "returns an empty array if zero tiles are drawn" do
      game_tiles = Scrabble::Tilebag.new
      game_tiles.draw_tiles(0).must_be_kind_of Array
      game_tiles.draw_tiles(0).must_equal []
    end

    it "tilebag has the correct number of tiles after tiles are drawn" do
      game_tiles = Scrabble::Tilebag.new
      num_initial_tiles = game_tiles.tilebag.length
      num_tiles_drawn = game_tiles.draw_tiles(3).length
      (num_initial_tiles - num_tiles_drawn).must_equal 95
    end

    it "returned array is the same size as the number of tiles drawn" do
      game_tiles = Scrabble::Tilebag.new
      game_tiles.draw_tiles(3).length.must_equal 3
    end
  end

  describe "tiles remaining" do
    it "returns an integer" do
      game_tiles = Scrabble::Tilebag.new
      game_tiles.tiles_remaining.must_be_kind_of Integer
    end

    it "correctly accounts for the number of remaining tiles in the bag" do
      game_tiles = Scrabble::Tilebag.new
      game_tiles.draw_tiles(4)
      game_tiles.tiles_remaining.must_equal 94
      game_tiles.draw_tiles(6)
      game_tiles.tiles_remaining.must_equal 88
    end
  end
end
