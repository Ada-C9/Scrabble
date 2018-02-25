require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/tilebag'

# Get that nice colorized output
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

<<<<<<< HEAD
describe 'TileBag' do
  describe '#initialize' do
    it 'starts with all of the default tiles' do
      # Arrange

      # Act
      tilebag = Scrabble::TileBag.new

      # Assert
      tilebag.tiles.must_be_kind_of Array
      tilebag.tiles.each do |tile|
        tile.must_be_kind_of String
        tile.length.must_equal 1
      end
      # tilebag.tiles.length.must_equal 98
    end
=======
describe 'Tilebag' do
  describe '#initialize' do
    it 'starts with all the default tiles' do
      tile_bag = Scrabble::TileBag.new
      tile_bag.tiles.must_be_kind_of Array
      tile_bag.tiles.each do |tile|
        tile.must_be_kind_of String
        tile.length.must_equal 1
      end
      tile_bag.tiles.length.must_equal 98
    end
  end

  xdescribe 'draw_tiles' do

  end

  xdescribe 'tiles_remaining' do

  end
end
