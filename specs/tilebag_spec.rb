require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/tilebag'

# Get that nice colorized output
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new


describe 'Tilebag' do
  describe 'initialize' do
    it 'returns bag' do

      our_bag = Scrabble::Tilebag.new
      our_bag.bag.must_be_kind_of Array
      our_bag.bag.must_equal ["A", "A", "A", "A", "A", "A", "A", "A", "A", "B", "B", "C", "C", "D", "D", "D", "D", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "F", "F", "G", "G", "G", "H", "H", "I", "I", "I", "I", "I", "I", "I", "I", "I", "J", "K", "L", "L", "L", "L", "M", "M", "N", "N", "N", "N", "N", "N", "O", "O", "O", "O", "O", "O", "O", "O", "P", "P", "Q", "R", "R", "R", "R", "R", "R", "S", "S", "S", "S", "T", "T", "T", "T", "T", "T", "U", "U", "U", "U", "V", "V", "W", "X", "X", "Y"]

    end

    it 'returns remaining tiles' do

      our_bag = Scrabble::Tilebag.new
      our_bag.tiles_remaining.must_equal 96

    end
  end

  describe 'draw_tiles' do
    it 'returns nil if not enough tiles remain' do
      our_bag = Scrabble::Tilebag.new
      picked_tiles = our_bag.draw_tiles(100)
      picked_tiles.must_be_nil
    end

    it 'returns appropriate number of tiles when small number requested' do
      our_bag = Scrabble::Tilebag.new
      picked_tiles = our_bag.draw_tiles(3)
      picked_tiles.must_be_kind_of Array
      picked_tiles.length.must_equal 3
    end

    it 'returns appropriate number of tiles when large number requested' do
      our_bag = Scrabble::Tilebag.new
      picked_tiles = our_bag.draw_tiles(80)
      picked_tiles.must_be_kind_of Array
      picked_tiles.length.must_equal 80
    end

    it 'removes picked tiles from the bag with small number' do
      our_bag = Scrabble::Tilebag.new

      our_bag.draw_tiles(3)

      our_bag.bag.length.must_equal 93
    end

    it 'removes picked tiles from the bag with small number' do
      our_bag = Scrabble::Tilebag.new

      our_bag.draw_tiles(80)

      our_bag.bag.length.must_equal 16
    end

    # # start of test to determine if the appropriate tiles are removed
    # it 'removes the appropriate tiles from the bag' do
    #   our_bag = Scrabble::Tilebag.new
    #   picked_tiles = our_bag.draw_tiles(10)
    #
    #   counts = Hash.new 0
    #   picked_tiles.each do |tile|
    #     counts[tile] += 1
    #   end

  end




end
