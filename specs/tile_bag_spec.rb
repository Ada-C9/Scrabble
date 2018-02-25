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

  describe '#tiles_remaining' do
    it "returns the number of tiles left after tiles are drawn" do
      new_tiles = Scrabble::TileBag.new
      new_tiles.draw_tiles(7)

      new_tiles.tiles_remaining.must_equal 91
    end
  end
end
