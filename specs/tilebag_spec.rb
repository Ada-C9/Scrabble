require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/player'
require_relative '../lib/scoring'
require_relative '../lib/tilebag'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'TileBag' do

  before do
    @bag = Scrabble::TileBag.new
  end

  describe 'initialize' do
    it 'has a collection of all tiles' do
      new_bag = Scrabble::TileBag.new
      new_bag.must_be_instance_of Scrabble::TileBag
      new_bag.tilebag.length.must_equal 26
      new_bag.tilebag.must_be_kind_of Hash
    end
  end

  describe 'draw_tiles' do
    it 'returns an array of random tiles' do
      @bag.draw_tiles(3).must_be_kind_of Array
      @bag.draw_tiles(3)[2].must_be_kind_of String
    end

    it 'removes drawn tiles from tile bag' do
      old_total = @bag.tilebag.values.sum
      removed = @bag.draw_tiles(3).length
      new_total = @bag.tilebag.values.sum
      new_total.must_equal (old_total - removed)
    end
  end

  describe 'tiles_remaining' do
    it 'returns the number of tiles remaining' do
      @bag.draw_tiles(7)
      remaining_tiles = @bag.tilebag.values.sum
      @bag.tiles_remaining.must_equal remaining_tiles
    end
  end
end
