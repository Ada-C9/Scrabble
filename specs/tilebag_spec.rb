require 'pry'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/tilebag'

# Get that nice colorized output
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'TileBag' do


  describe 'initialize' do

    it "Sets up instance with a collection of tiles" do
      new_pool = Scrabble::TileBag.new
      # binding.pry
      quantities = { "a" => 9,"b" => 2,"c" => 2,"d" => 4,"e" => 12,"f" => 2,"g" => 3,"h" => 2, "i" => 9,"j" => 1,"k" => 1, "l" => 4,"m" => 2,"n" => 6,"o" => 8,"p" => 2, "q" => 1, "r" => 6, "s" => 4, "t" => 6, "u" => 4, "v" => 2, "w" => 2, "x" => 1, "y" => 2, "z" => 1 }
      new_pool.total_tiles.must_equal quantities
    end

  end

  describe 'draw_tiles(num)' do

    it "returns an empty array if asked for zero tiles" do
      test_five = Scrabble::TileBag.new
      previous_bag = test_five.total_tiles

      result = test_five.draw_tiles(0)
      result.must_be_kind_of Array
      result.must_equal []
      test_five.total_tiles.must_equal previous_bag
    end

    it "raises an argument error if the user tries to take more tiles than are available" do
      new_bag = Scrabble::TileBag.new
      result = proc { new_bag.draw_tiles(100) }
      result.must_raise ArgumentError
    end

    it "returns collection of random tiles" do
      test_2 = Scrabble::TileBag.new
      previous_bag = test_2.total_tiles

      result = test_2.draw_tiles(7)
      result.must_be_kind_of Array

      included = result.all? do |tile|
        previous_bag.include?(tile)
      end
      included.must_equal true

    end

    it "removes the selected tiles from default set" do
      other_pool = Scrabble::TileBag.new
      original_count = other_pool.total_tiles.values.sum
      other_pool.draw_tiles(7)

      other_pool.total_tiles.values.sum.must_equal original_count - 7
    end


  end

  describe 'tiles_remaining' do

    it "returns a integer" do
      test_three = Scrabble::TileBag.new
      original_count = test_three.total_tiles.values.sum
      test_three.draw_tiles(7)
      result = test_three.tiles_remaining
      result.must_be_kind_of Integer
      result.must_equal original_count - 7
    end

  end

end # describe TileBag
