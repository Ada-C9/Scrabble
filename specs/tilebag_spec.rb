require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/tilebag'

# Get that nice colorized output
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Tilebag' do
  describe '#initialize' do
    it 'starts with all of the default tiles' do
      bag = Scrabble::TileBag.new
      bag.tile_bag.must_be_kind_of Hash
      alphabet = ('a'..'z').to_a
      bag.tile_bag.each do |key, value|
        key.must_be_kind_of Symbol
        value.must_be_kind_of Integer
        alphabet.include?(key.to_s).must_equal true
        alphabet.delete(key.to_s)
      end
      alphabet.length.must_equal 0
      bag.tiles_remaining.must_equal 98
    end
  end

  describe 'draw tiles' do
    it 'draws the number of tiles passed in as an argument' do
      game_1_tiles = Scrabble::TileBag.new
      result = game_1_tiles.draw_tiles(5)
      result.length.must_equal(5)
    end

    it 'does not draw if the number passed in is 0' do
      game_1_tiles = Scrabble::TileBag.new
      result = game_1_tiles.draw_tiles(0)
      result.length.must_equal(0)
    end

    it 'decrements the amount of letters remaining for a letter tile that is drawn' do
      game_1_tiles = Scrabble::TileBag.new
      before = game_1_tiles.tile_bag.clone
      drawn_tiles = game_1_tiles.draw_tiles(1)
      symbol = drawn_tiles[0][0]

      (before[symbol] - game_1_tiles.tile_bag[symbol]).must_equal 1
    end
  end

  describe 'tiles remaining' do
    it 'updates the number of tiles remaining after tiles are drawn' do
      game_1_tiles = Scrabble::TileBag.new
      game_1_tiles.draw_tiles(1)
      game_1_tiles.tiles_remaining.must_equal(97)
    end

  end
end
