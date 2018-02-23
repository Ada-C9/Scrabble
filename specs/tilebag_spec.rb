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
end
