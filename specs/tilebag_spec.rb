require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/tilebag'

# Get that nice colorized output
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Tilebag' do
  before do
    @tilebag = Scrabble::Tilebag.new
  end
  describe '#init method' do
    it "should be an instance of tilebag" do

      @tilebag.must_be_instance_of Scrabble::Tilebag
    end

    it "should include a collection of default tiles" do

    @tilebag.tiles.must_be_kind_of Array
    @tilebag.tiles.length.must_equal 98
    end
  end

  describe '#draw_tiles(num)' do
    it "returns an array of tiles" do
      @tilebag.draw_tiles(9)

      @tilebag.draw_tiles(9).must_be_kind_of Array
      @tilebag.draw_tiles(9).length.must_equal 9
    end
  end

  describe 'tiles_remaining' do
    it "returns number of tiles remaining after draw_tiles" do
      @tilebag.draw_tiles(9)

      @tilebag.tiles_remaining.must_equal 89
    end
  end
end


# From the tilebag you should be able to draw tiles. Once they have been drawn from the bag, it should remove those from the orginal quanity.

# Then add all the remaining quatities up to give what remains in the tilebag.
