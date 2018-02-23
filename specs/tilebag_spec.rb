require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/tilebag'

# Get that nice colorized output
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'TileBag' do
  describe 'initialize' do
    it 'sets up an instance of default tiles' do
      tile_bag = Scrabble::TileBag.new

      tile_bag.must_be_kind_of Scrabble::TileBag
      tile_bag.initial_bag.must_be_kind_of Array
      tile_bag.initial_bag.size.must_equal 98
      # TODO make sure all the values are int and positive
    end
  end

  describe 'draw_tiles(num)' do
    it 'returns a collection of random tile' do
      tile_bag = Scrabble::TileBag.new
      num = 5

      draw = tile_bag.draw_tiles(num)

      draw.length.must_equal 5
      draw.must_be_kind_of Array
      assert draw.all? { |letter| letter.class == String }
    end

    it 'removes tiles from default set' do
      tile_bag = Scrabble::TileBag.new
      num = 5
      size_before = 98
      tile_bag.draw_tiles(num)

      tile_bag.tiles_remaining.must_equal size_before - num
    end

    it 'must draw number of tiles between 0 and 8 (exclusive)' do
      tile_bag = Scrabble::TileBag.new

      draw_1 = tile_bag.draw_tiles(0)
      draw_2 = tile_bag.draw_tiles(8)

      draw_1.must_be_nil
      draw_2.must_be_nil
    end


    it 'does not draw unavailable letter' do
      tile_bag = Scrabble::TileBag.new

      14.times do
        tile_bag.draw_tiles(7)
      end

      tile_bag.draw_tiles(1).must_be_nil
    end

  end

  describe 'tiles_remaining' do
    it 'returns how many tiles are left' do
      tile_bag = Scrabble::TileBag.new

      tile_bag.tiles_remaining.must_equal 98

      tile_bag.draw_tiles(5)
      tile_bag.tiles_remaining.must_equal 93
    end
  end

end
