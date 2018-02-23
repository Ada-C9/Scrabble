require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require 'pry'

require_relative '../lib/tilebag'

# Get that nice colorized output
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe "TileBag" do

  before do
    @initial_tile_set = {
      :A => 9, :N => 6, :B => 2, :O => 8, :C => 2,
      :P => 2, :D => 4, :Q => 1, :E => 12, :R => 6,
      :F => 2, :S => 4, :G => 3, :T => 6, :H => 2,
      :U => 4, :I => 9, :V => 2, :J => 1, :W => 2,
      :K => 1, :X => 1, :L => 4, :Y => 2, :M => 2,
      :Z => 1
    }
  end

  describe "initialize" do

    it "sets up the instance with a collection of all default tiles" do
      new_tilebag = Scrabble::TileBag.new(@initial_tile_set)

      new_tilebag.tiles_in_bag[:A].must_equal 9
      new_tilebag.tiles_in_bag[:Z].must_equal 1
      new_tilebag.tiles_in_bag[:O].must_equal 8
      new_tilebag.tiles_in_bag[:R].must_equal 6
      #
      # new_tilebag.tiles_in_bag.length.must_equal 26

    end

  end

  describe "draw_tiles(num)" do

    it "returns a collection of random tiles" do
      tile_bag_1 = Scrabble::TileBag.new(@initial_tile_set).draw_tiles(7)
      tile_bag_2 = Scrabble::TileBag.new(@initial_tile_set).draw_tiles(7)
      tile_bag_3 = Scrabble::TileBag.new(@initial_tile_set).draw_tiles(7)

      tile_bag_1.wont_be_same_as tile_bag_2

      tile_bag_1.wont_be_same_as tile_bag_3

      tile_bag_2.wont_be_same_as.tile_bag_3

    end

    it "returns an array of tiles of the specified length" do

      draw_length_test =    Scrabble::TileBag.new(@initial_tile_set)

      draw_length_test.draw_tiles(5)

      draw_length_test.draw_array.must_be_kind_of Array

      draw_length_test.draw_array.length.must_equal 5

    end

    xit "removes the tiles from the default set" do
      tile_bag_test = Scrabble::TileBag.new(@initial_tile_set)


      tiles_in_bag_old = @tiles_in_bag
      # binding.pry

      tile_bag_test.draw_tiles(3)

      tiles_in_bag_old[tile_bag_test.draw_array[0]].must_equal @tiles_in_bag[tile_bag_test.draw_array[0]] + 1

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
