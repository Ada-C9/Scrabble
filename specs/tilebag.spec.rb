require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/tilebag'


Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'TileBag' do

  describe '#initialize' do

    it 'starts all of the default tiles' do
      tilebag = Scrabble::TileBag.new
      tilebag.tiles.must_be_kind_of Array

      tilebag.tiles.each do |tile|
        tile.must_be_kind_of String
        tile.length.must_equal 1
      end

      tilebag.tiles.length.must_equal 98
    end
  end # end of describe initialize

  describe 'draw_tiles(num)' do
    it "returns a collection of random tiles, removes the tiles from the default set" do
      num = 3
      draw_1 = Scrabble::Tilebag.new

      draw_1.draw_tiles(num).must_be_kind_of Array
      draw_1.draw_tiles(num).length.must_equal 3
    end
  end # end of describe 'draw_tiles(num)'

  describe 'tiles_remaining' do
    it "correctly returns the number of tiles remaining in the bag" do
      draw_1 = Scrabble::Tilebag.new

      draw_1.draw_tiles(4).must_be_kind_of Array
      draw_1.tiles_remaining.must_equal 94
    end
  end # end of describe 'tiles_remaining'
end # end of describe 'TileBag'
