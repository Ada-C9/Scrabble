require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/tile_bag'


Minitest::Reporters.use!
Minitest::Reporters::SpecReporter.new

describe "TileBag" do
  describe 'initialize' do
    it 'Takes a TileBag collection' do
      tile_bag = Scrabble::TileBag.new({"a" => 1, "b" => 2})

      tile_bag.must_be_instance_of Scrabble::TileBag
      tile_bag.must_respond_to :bag
      tile_bag.bag.must_be_kind_of Hash
      tile_bag.bag.must_equal ({"a" => 1, "b" => 2})

    end

    describe '#draw_tiles(num)' do
      it 'Draws tiles from the tile bag' do
        tile_bag = Scrabble::TileBag.new({"a" => 1, "b" => 2, "c" => 3})

        tile_bag.draw_tiles(3).must_be_kind_of Array
        tile_bag.draw_tiles(3).must_include ("a" || "b" || "c")
        tile_bag.draw_tiles(3).length.must_equal 3

      end

      # it 'Removes tiles from the default set' do



      # end

    end

  end



end
