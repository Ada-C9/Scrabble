require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/tilebag'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'TileBag' do

  let(:tilebag) {Scrabble::TileBag.new}

  describe '#initialize' do
    it 'Should set up the instance with a collection of all default tiles' do
      tilebag.tiles.must_be_instance_of Array
      tilebag.tiles.length.must_equal 98
    end

    it 'confirms correct number of tiles in tilebag' do
      tilebag.tiles.select { |tile| tile == 'A' }.length.must_equal 9
      tilebag.tiles.select { |tile| tile == 'B' }.length.must_equal 2
    end

  end

  describe '#draw_tiles(num)' do
    it "raises an ArgumentError if num is not Integer" do
      proc {tilebag.draw_tiles("one")}.must_raise ArgumentError
      proc {tilebag.draw_tiles("1")}.must_raise ArgumentError
      proc {tilebag.draw_tiles(2.45)}.must_raise ArgumentError
      proc {tilebag.draw_tiles(1.0)}.must_raise ArgumentError
    end

    it 'returns a collection of random tiles' do
      tilebag.draw_tiles(1).must_be_instance_of Array
      tilebag.draw_tiles(0).length.must_equal 0

    end
    it "removes the tiles from the default set" do
      tilebag.draw_tiles(5)
      tilebag.tiles_remaining.must_equal 93
    end
  end

  describe '#tiles_remaining' do
    it "returns the number of tiles remaining in the bag" do
      tilebag.draw_tiles(5)
      tilebag.tiles_remaining.must_equal 93
    end
  end

end
