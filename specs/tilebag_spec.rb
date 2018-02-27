require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/tilebag.rb'

# Get that nice colorized output
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'tile bag test' do

  it 'it returns 7 tiles' do
    new_bag = Scrabble::Tilebag.new

  tiles = new_bag.draw_tiles(7)

  tiles.length.must_equal 7
  end

  # NOT FUNCTIONING
  # xit 'Can not draw more tiles than is available' do
  #   # ['a', 'e', 'i', 'o']
  #   new_bag = Scrabble::Tilebag.new
  #   new_bag.draw_tiles(100)
  #
  #   new_bag.wont_be:>, 100
  # end


end
