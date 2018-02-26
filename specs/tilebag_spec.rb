require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require 'pry'

require_relative '../lib/tilebag'

# Get that nice colorized output
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'TileBag' do

  describe 'new' do
    it 'sets up with collection of all default tiles' do
      grab_bag = Scrabble::TileBag.new

      grab_bag.must_be_instance_of Scrabble::TileBag
      grab_bag.starting_tiles[:A].must_equal 9
      grab_bag.starting_tiles[:Z].must_equal 1
    end
  end

  describe 'draw_tiles' do
    it 'returns a collection of random tiles' do
      grab_bag = Scrabble::TileBag.new
      test_array = grab_bag.draw_tiles(6)
      test_array.length.must_equal 6

    end

    it 'removes used tiles from the default set' do

      grab_bag = Scrabble::TileBag.new

      original_number_of_tiles = grab_bag.tiles_remaining
      grab_bag.draw_tiles(6)

      expected_number_of_tiles = original_number_of_tiles - 6
      actual_number_of_tiles = grab_bag.tiles_remaining

      actual_number_of_tiles.must_equal expected_number_of_tiles

    end

  end

  xdescribe 'tiles_remaining' do
    it 'returns the number of tiles remaining in the bag' do
      grab_bag = Scrabble::TileBag.new

      number_of_tiles = grab_bag.tiles_remaining

      grab_bag.remaining_tiles.length.must_equal number_of_tiles

    end
  end
end
