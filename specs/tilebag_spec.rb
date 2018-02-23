require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require 'pry'

require_relative '../lib/tilebag'

# Get that nice colorized output
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'TileBag' do

  describe 'new' do
    it 'sets up with collection of all default tiles' do
      grab_bag = Scrabble::TileBag.new

      grab_bag.must_be_instance_of Scrabble::TileBag
      grab_bag.starting_tiles[:A].must_equal 9
      grab_bag.starting_tiles[:Z].must_equal 1
    end
  end

  describe 'draw_tiles' do
    it 'returns a collection of random tiles' do
      grab_bag = Scrabble::TileBag.new
      collection_of_tiles = []

      first_letter = grab_bag.draw_tiles
      collection_of_tiles << first_letter

      second_letter = grab_bag.draw_tiles
      collection_of_tiles << second_letter

      collection_of_tiles.must_equal [first_letter, second_letter]

    end

    xit 'removes used tiles from the default set' do
    end
  end

  xdescribe 'tiles_remaining' do
    it 'returns the number of tiles remaining in the bag' do

    end
  end
end
