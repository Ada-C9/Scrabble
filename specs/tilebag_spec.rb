require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require 'pry'

require_relative '../lib/tilebag'

# Get that nice colorized output
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe "TileBag" do

  describe "initialize" do

    it "sets up the instance with a collection of all default tiles" do
      new_tilebag = Scrabble::TileBag.new

      new_tilebag.tiles_in_bag[:A].must_equal 9
      new_tilebag.tiles_in_bag[:Z].must_equal 1
      new_tilebag.tiles_in_bag[:O].must_equal 8
      new_tilebag.tiles_in_bag[:R].must_equal 6

      new_tilebag.tiles_in_bag.length.must_equal 26

    end

  end

  describe "draw_tiles(num)" do

    it "returns a collection of random tiles" do
      tile_bag_1 = Scrabble::TileBag.new.draw_tiles(7)
      tile_bag_2 = Scrabble::TileBag.new.draw_tiles(7)
      tile_bag_3 = Scrabble::TileBag.new.draw_tiles(7)

      tile_bag_1.wont_be_same_as tile_bag_2

      tile_bag_1.wont_be_same_as tile_bag_3

      tile_bag_2.wont_be_same_as.tile_bag_3

    end

    it "returns an array of tiles of the specified length" do

      draw_length_test =    Scrabble::TileBag.new.draw_tiles(5)

      draw_length_test.draw_array.must_be_kind_of Array

      draw_length_test.draw_array.length.must_equal 5

    end

    it "removes the tiles from the default set" do

      tile_bag_test = Scrabble::Tilebag.new.draw_tiles(3)

      # old_tiles_available = tiles_in_bag.test_draw_array[0].values.flatten
      #
      # new_tiles_available = tiles_in_bag.fetch(tile_bag_test.draw_array[0][0])
      #
      # new_tiles_available.must_equal 1 + old_tiles_available
      #
      # tile_bag_test.tiles_in_bag[draw_array[0][0]]#Some method looks up key
      #   .value.must_equal #that same key.value + 1



    end

  end

end





#
