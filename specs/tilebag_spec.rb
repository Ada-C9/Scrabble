require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/tilebag.rb'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'tilebag class' do
  describe 'initialize method' do
    it 'TileBag.new creates a new instance' do
      new_bag = Scrabble::TileBag.new
      new_bag.must_be_instance_of Scrabble::TileBag
    end
  end

  describe 'draw_tiles method' do
    it 'can return the right number of tiles requested' do
      new_bag = Scrabble::TileBag.new
      new_bag.draw_tiles(3).must_be_kind_of Array
      new_bag.draw_tiles(3).length.must_equal 3
    end

    it 'can return empty array when player needs no need tiles' do
      new_bag = Scrabble::TileBag.new
      new_bag.draw_tiles(0).must_be_kind_of Array
      new_bag.draw_tiles(0).must_equal []
    end

    it 'removes the drawn tiles from the collection of all tiles' do
      new_bag = Scrabble::TileBag.new
      tiles_left = new_bag.all_tiles.length
      new_bag.draw_tiles(3)
      new_bag.all_tiles.length.must_equal tiles_left - 3
    end
  end

  describe 'tiles_remaining method' do
    it 'can return number of tiles left in the bag' do
      new_bag = Scrabble::TileBag.new
      new_bag.draw_tiles(3)
      new_bag.tiles_remaining.must_equal 95
    end
  end
end
