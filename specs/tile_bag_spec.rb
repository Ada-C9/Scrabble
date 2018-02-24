require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/tile_bag'

describe '#draw_tiles' do
  it 'returns a collection of random tiles' do
    new_tiles = Scrabble::Tile_Bag.new
    new_tiles.draw_tiles(8)

    new_tiles.length.must_equal 8
  end

  it 'removes the tiles from the default set' do
    new_tiles = Scrabble::Tile_Bag.new
    new_tiles.draw_tiles(8)

    new_tiles.length.must_equal 90

  end
end
