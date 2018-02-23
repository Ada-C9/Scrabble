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

      new_tilebag.tiles_in_bag.length.must_equal 26

    end

  end

  describe "draw_tiles(num)" do

    it "returns a collection of random tiles" do
      tile_bag_1 = Scrabble::TileBag.new(@initial_tile_set).draw_tiles(7)
      tile_bag_2 = Scrabble::TileBag.new(@initial_tile_set).draw_tiles(7)
      tile_bag_3 = Scrabble::TileBag.new(@initial_tile_set).draw_tiles(7)

      tile_bag_1.wont_be_same_as tile_bag_2

      tile_bag_1.wont_be_same_as tile_bag_3

      tile_bag_2.wont_be_same_as tile_bag_3

    end

    it "returns an array of tiles of the specified length" do

      draw_length_test =    Scrabble::TileBag.new(@initial_tile_set)

      draw_array = draw_length_test.draw_tiles(5)

      draw_array.must_be_kind_of Array

      draw_array.length.must_equal 5

    end

    it "removes the tiles from the default set" do
      initial_tile_set = {
        :A => 9, :N => 6, :B => 2, :O => 8, :C => 2,
        :P => 2, :D => 4, :Q => 1, :E => 12, :R => 6,
        :F => 2, :S => 4, :G => 3, :T => 6, :H => 2,
        :U => 4, :I => 9, :V => 2, :J => 1, :W => 2,
        :K => 1, :X => 1, :L => 4, :Y => 2, :M => 2,
        :Z => 1
      }

      tile_bag_test = Scrabble::TileBag.new(initial_tile_set.dup)

      draw_array = tile_bag_test.draw_tiles(3)

      tile = draw_array[0]

      starting_tile_quantity = initial_tile_set.fetch(tile)

      ending_tile_quantity = tile_bag_test.tiles_in_bag.fetch(tile)

      initial_tile_set.must_be_kind_of Hash

      starting_tile_quantity.must_equal ending_tile_quantity + 1

    end

  end

  describe "tiles_remaining" do

    it "returns the number of tiles remaining in the bag" do
      original_tile_set = {
        :A => 9, :N => 6, :B => 2, :O => 8, :C => 2,
        :P => 2, :D => 4, :Q => 1, :E => 12, :R => 6,
        :F => 2, :S => 4, :G => 3, :T => 6, :H => 2,
        :U => 4, :I => 9, :V => 2, :J => 1, :W => 2,
        :K => 1, :X => 1, :L => 4, :Y => 2, :M => 2,
        :Z => 1
      }

      tile_bag_test_2 = Scrabble::TileBag.new(original_tile_set)

      tile_count = tile_bag_test_2.tiles_remaining

      tile_count.must_equal 98

      # binding.pry
    end

  end

end





#
