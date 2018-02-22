require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/tile_bag'



describe 'TileBag' do
  # before do
  #   test = Scrabble::TileBag.new
  # end

  describe 'TileBag#initialize' do
    it 'sets up an instance with a collection of all default tiles'do
    # Arrange
    test_1 = Scrabble::TileBag.new
    # Act
    result = test_1.all_tiles.size
    result1 = test_1.all_tiles
    # Assert
    result.must_equal 98
    result1.must_be_kind_of Array
  end
end

describe 'TileBag#draw_tiles(num)' do
  it 'returns a collection of random tiles' do
    # Arrange
    test_1 = Scrabble::TileBag.new
    # Act
    result = test_1.draw_tiles(7)

    # Assert
    result.length.must_equal 7
    result.wont_equal [:A, :A, :A, :A, :A, :A, :A]
  end

  it 'removes tiles from the default set'do
  # Arrange
  test_1 = Scrabble::TileBag.new
  test_1.draw_tiles(5)

  # Act
  result = test_1.tiles_remaining.size

  # Assert
  result.must_equal 93

  end

  it 'returns tiles remaining if less than number of tiles requested' do
    # Arrange
    test_1 = Scrabble::TileBag.new
    # Act
    result = test_1.draw_tiles(100)
    # Assert
    result.length.wont_equal 100
  end
end
end
