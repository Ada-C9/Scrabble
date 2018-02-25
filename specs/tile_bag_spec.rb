require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/tile_bag'

describe '#draw_tiles' do
  it 'returns the number of tiles the user asks for' do
    new_tiles = Scrabble::TileBag.new
    new_tiles.draw_tiles(7)

    new_tiles.tile_bag.length.must_equal 7
  end

  # it 'removes the tiles from the default set' do
  #   new_tiles = Scrabble::TileBag.new
  #   new_tiles.draw_tiles(1)
  #   if tile_bag = [:Z]
  # end
end
