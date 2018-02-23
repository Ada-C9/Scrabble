require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/tilebag'
#With this, i wont have to retype scrabble::tilebag.new so many times.
describe "tilebag" do
  before do
    @tile_bag = Scrabble::TileBag.new
  end

  describe "tile bag can be created/initialized" do
    it "creates instance of tilebag with a collection of all tiles" do
      @tile_bag.must_be_instance_of Scrabble::TileBag
    end
  end
  #testing for edge cases of drawing tiles, like drawing more than are in the tilebag, or drawing no tiles.
  describe "draw tiles" do
    it "returns nil if input is more than tiles in tilebag" do
      @tile_bag.draw_tiles(50000).must_be_nil true
    end
    #in between case
    # Making sure drawn tiles will be returned to player
    it "returns tiles to user in array" do
      @tile_bag.draw_tiles(5).must_be_kind_of Array
    end
    # Testing for an edge case.
    it "returns an empty array of tiles to user" do
      @tile_bag.draw_tiles(0).must_be_empty Array
    end
  end

  describe "tiles left in tilebag" do
    it "takes a tile away from total letter quantity and returns num of remaining
    tiles in tilebag" do
    @tile_bag.draw_tiles(7)
    @tile_bag.tiles_remaining.must_equal 91
  end
  it "returns the total letter quantity when no tile(s) is drawn" do
    @tile_bag.draw_tiles(0)
    @tile_bag.tiles_remaining.must_equal 98
    # Wont need to test for edge case if all the tiles are drawn with return of 0, because we already did this in previous draw tile test.
  end
end
end
