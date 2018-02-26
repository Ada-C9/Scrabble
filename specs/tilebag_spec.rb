require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/tilebag'

# Get that nice colorized output
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

<<<<<<< HEAD
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
=======
>>>>>>> 63e10b980789cec14cd9c17435143fee723b3388
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

  describe 'draw_tiles' do
    it "draws tiles" do
      tile_bag = Scrabble::TileBag.new
      tile_bag.draw_tiles(1)
      proc {tile_bag.draw_tiles(99)}
    end

    it "returns a collection of random tiles " do
      tile_bag = Scrabble::TileBag.new
      result = tile_bag.draw_tiles(5)
      result.must_be_kind_of Array
      result.length.must_equal 5
    end

    it "removes the tiles from the default set " do
      tile_bag = Scrabble::TileBag.new
      before_count = 98
      tile_bag.draw_tiles(5)
      after_count = tile_bag.tiles_remaining
      after_count.must_equal 93
    end
  end


<<<<<<< HEAD
=======

  describe 'tiles_remaining' do
    it "returns how many tiles remain in the tile bag" do
    tile_bag = Scrabble::TileBag.new
    tile_bag.draw_tiles(9)
    tile_bag.tiles_remaining.must_equal 89
    end
>>>>>>> 63e10b980789cec14cd9c17435143fee723b3388
  end

end
