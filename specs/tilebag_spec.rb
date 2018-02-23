require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/tilebag'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new


describe 'TileBag' do
  describe 'initialize' do
    it 'can be instantiated' do
      tile_bag_test = Scrabble::TileBag.new
      tile_bag_test.tile_bag.must_be_instance_of Array

    end
  end
   xdescribe 'draw_tiles' do
     it 'can return a random array of characters' do
       random_arr = Scrabble::TileBag.new
       array_of_char = random_arr.draw_tiles(4)
       array_of_char.must_be_instance_of Array
     end

     it 'can return the size of an array input by the user' do
       random_arr = Scrabble::TileBag.new
       arr_of_char = random_arr.draw_tiles(5)
       arr_of_char.length.must_be_length(5)
     end
   end
end














# describe 'TileBag' do
#
#   describe 'draw_tiles' do
#     it 'returns a random number of tiles given by the user and deletes from the tile bag' do
#       r = ['rrr']
#       tile_bag_test = Scrabble::TileBag.new(r)
#       tile_bag_test.draw_tiles(4)
#       tile_bag_test.must_be_instance_of Array
#       tile_bag_test.length.must_equal 4
#     end
#   end
# end

  # describe 'plays' do
  #   it 'returns an Array' do
  #     player_name = Scrabble::Player.new ("Ada")
  #     player_name.plays.must_be_instance_of Array
  #   end
  #
  # end
