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
  describe '#initialize Method' do
    it "should be an instance of tilebag" do
      
      @tilebag.must_respond_to :tiles
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
    it "returns number of tiles remaining after drawing tiles" do
      @tilebag.draw_tiles(9)
      @tilebag.must_respond_to :tiles_remaining

      @tilebag.tiles_remaining.must_equal 89
    end
  end
end
