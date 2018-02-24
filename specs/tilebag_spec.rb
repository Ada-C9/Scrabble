require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/tilebag'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'TileBag' do
  describe 'initialize' do
    it 'can be instantiated' do
      tile_bag_test = Scrabble::TileBag.new
      tile_bag_test.tile_bag.must_be_instance_of Hash
    end
  end

  describe 'draw_tiles' do
    it 'can return a random array of characters of a specified size' do
      random_arr = Scrabble::TileBag.new
      array_of_char = random_arr.draw_tiles(4)
      array_of_char.must_be_instance_of Array
      array_of_char.length.must_equal 4
    end


    it 'returns an empty array of tiles when there is not enough tiles ' do
      tile_bag_test = Scrabble::TileBag.new
      random_tiles = tile_bag_test.draw_tiles(100)
      random_tiles.must_be_instance_of Array
      random_tiles.length.must_equal 0
    end

    it 'returns an empty array of tiles when given a number less than 1' do
      tile_bag_test = Scrabble::TileBag.new
      random_tiles = tile_bag_test.draw_tiles(0)
      random_tiles.must_be_instance_of Array
      random_tiles.length.must_equal 0
    end


    it 'deletes the tiles from the tile bag' do
      tile_bag_test = Scrabble::TileBag.new
      random_tiles = tile_bag_test.draw_tiles(4)
      tile_bag_test.tiles_remaining.must_equal 94
    end

  end

  describe 'tiles_remaining' do
    it "returns the number of tiles remaining in a new tile bag " do
      tile_bag_test = Scrabble::TileBag.new
      tile_bag_test.tiles_remaining.must_equal 98
    end

  end
end
