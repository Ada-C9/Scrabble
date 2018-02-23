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
      quantities = { "a" => 1,"b" => 3,"c" => 3,"d" => 2,"e" => 1,"f" => 4,"g" => 2,"h" => 4,
        "i" => 1,"j" => 8,"k" => 5, "l" => 1,"m" => 3,"n" => 1,"o" => 1,"p" => 3,
        "q" => 10, "r" => 1, "s" => 1, "t" => 1, "u" => 1, "v" => 4, "w" => 4,
        "x" => 8, "y" => 4, "z" => 10 }
      new_pool.total_tiles.must_equal quantities
    end

  end

  describe 'draw_tiles(num)' do

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

  end

end # describe TileBag
