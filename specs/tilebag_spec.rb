# Kaitlin Forsman and Kirsten Schumy
# Ada Cohort[9], Ampers
# Scrabble Assignment

require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/tilebag'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'TileBag' do

  describe 'initialize' do
    it 'sets up an instance of default tiles' do
      tile_bag = Scrabble::TileBag.new
      tile_bag.must_be_kind_of Scrabble::TileBag
      tile_bag.must_respond_to :tiles_in_bag
      tile_bag.tiles_in_bag.must_be_kind_of Array
      tile_bag.tiles_in_bag.size.must_equal 98
    end

    it 'only includes letters' do
      tile_bag = Scrabble::TileBag.new
      tiles_from_bag = tile_bag.tiles_in_bag
      tiles_from_bag.all?(String).must_equal true
      tiles_from_bag.all? { |letter| letter.size == 1 }.must_equal true
      tiles_from_bag.all? { |letter| letter.match?(/[A-Z]/) }.must_equal true
    end

    it 'set up tiles_remaining at initialize' do
      tile_bag = Scrabble::TileBag.new
      tile_bag.tiles_remaining.must_equal 98
    end
  end

  describe 'draw_tiles(num)' do
    it 'returns a collection of random tile' do
      tile_bag = Scrabble::TileBag.new
      draw = tile_bag.draw_tiles(5)
      draw.length.must_equal 5
      draw.must_be_kind_of Array
      assert draw.all? { |letter| letter.class == String }
    end

    it 'removes tiles from default set' do
      tile_bag = Scrabble::TileBag.new
      size_before = 98
      tile_bag.draw_tiles(5)
      tile_bag.tiles_remaining.must_equal size_before - 5
    end

    it 'returns nil if requested number of tiles is < 1 or > 7' do
      tile_bag = Scrabble::TileBag.new
      tile_bag.draw_tiles(0).must_be_nil
      tile_bag.draw_tiles(8).must_be_nil
    end

    it 'returns nil if requested number of tiles is not an int' do
      tile_bag = Scrabble::TileBag.new
      tile_bag.draw_tiles("Gimme tiles").must_be_nil
    end

    it 'does not draw unavailable letter' do
      tile_bag = Scrabble::TileBag.new
      14.times { tile_bag.draw_tiles(7) }
      tile_bag.tiles_remaining.must_equal 0
      tile_bag.draw_tiles(1).must_be_nil
    end

    it 'does not draw tiles beyond the amount available' do
      tile_bag = Scrabble::TileBag.new
      13.times { tile_bag.draw_tiles(7) }
      tile_bag.draw_tiles(5)
      tile_bag.tiles_remaining.must_equal 2
      tile_bag.draw_tiles(3).size.must_equal 2
      tile_bag.tiles_remaining.must_equal 0
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
