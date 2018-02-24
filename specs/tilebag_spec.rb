require 'minitest/pride'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/tilebag'

# Get that nice colorized output
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'TileBag' do
  describe 'initialize' do
    it 'creates and instance'do
      tile_bag = Scrabble::TileBag.new
      tile_bag.must_be_instance_of Scrabble::TileBag
    end

    it 'contains a collection of tiles' do
      tile_bag = Scrabble::TileBag.new
      tile_bag.default_tiles.must_be_instance_of Hash
    end

    it 'returns 98 tiles ' do
      tile_bag = Scrabble::TileBag.new
      tile_bag.default_tiles.values.sum.must_equal 98
    end

  describe 'draw_tiles(num)' do
    it 'returns a collection of random tiles' do
      tile_bag = Scrabble::TileBag.new
      tile_bag.draw_tiles(4).must_be_instance_of Array
    end

    it 'removes tiles from the tile bag' do
      tile_bag = Scrabble::TileBag.new
      tile_bag.draw_tiles(7)
      tile_bag.default_tiles.values.sum.must_equal 91
    end
  end

  describe 'tiles_remaining' do
    it 'returns the remaining number of tiles' do
      tile_bag = Scrabble::TileBag.new
      tile_bag.draw_tiles(7)
      tile_bag.default_tiles.values.sum.must_equal 91
    end

    it 'returns no tiles if bag is empty' do
      tile_bag = Scrabble::TileBag.new
      tile_bag.draw_tiles(98)
      tile_bag.default_tiles.must_equal default_tiles ={}
    end
  end
end
end 
