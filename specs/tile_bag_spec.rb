require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/tile_bag'


Minitest::Reporters.use!
Minitest::Reporters::SpecReporter.new

describe "TileBag" do
  describe 'initialize' do
    it 'Takes a TileBag collection' do
      tile_bag = Scrabble::TileBag.new

      tile_bag.must_be_instance_of Scrabble::TileBag
      tile_bag.must_respond_to :bag
      tile_bag.bag.must_be_kind_of Hash

    end

    describe '#draw_tiles(num)' do
      it 'Draws tiles from the tile bag' do
        tile_bag = Scrabble::TileBag.new

        tile_bag.draw_tiles(3).must_be_kind_of Array
        # tile_bag.draw_tiles(3).must_include.any  "a" || "b" || "c"
        tile_bag.draw_tiles(3).length.must_equal 3

      end

      it 'Removes tiles from the default set' do
        tile_bag = Scrabble::TileBag.new

        new_bag = tile_bag.draw_tiles(3)
        sum_of_original_bag = tile_bag.bag.values.sum

        sum_of_original_bag.must_equal 98 - 3
        new_bag.length.must_equal 3
        tile_bag.bag.values.wont_include :<, 0

      end

    end

    describe '#tiles_remaining' do
      it "returns number of tiles remaining in bag" do
        tile_bag = Scrabble::TileBag.new

        tile_bag.draw_tiles(3)
        tile_bag.tiles_remaining.must_equal 98 - 3

      end
    end

  end



end
