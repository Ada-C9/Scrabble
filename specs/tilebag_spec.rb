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

      first_letter = grab_bag.draw_tiles(1)
      collection_of_tiles << first_letter

      second_letter = grab_bag.draw_tiles(1)
      collection_of_tiles << second_letter

      collection_of_tiles.must_equal [first_letter, second_letter]

    end

    it 'removes used tiles from the default set' do
      test_hash = {
        A: 9, B: 2, C: 2, D: 4, E: 12, F: 2,
        G: 3, H: 2, I: 9, J: 1, K: 1, L: 4,
        M: 2, N: 6, O: 8, P: 2, Q: 1, R: 6, S: 4,
        T: 6, U: 4, V: 2, W: 2, X: 1, Y: 2, Z: 1
      }

      grab_bag = Scrabble::TileBag.new
      collection_of_tiles = []

      first_letter = grab_bag.draw_tiles(1)
      first_letter = first_letter[0].to_sym
      grab_bag.starting_tiles[first_letter].must_equal test_hash[first_letter] - 1
    end
  end

  xdescribe 'tiles_remaining' do
    it 'returns the number of tiles remaining in the bag' do

    end
  end
end
