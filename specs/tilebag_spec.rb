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
    end
  end

  describe 'draw_tiles' do
    it 'returns a collection of random tiles' do
    end

    it 'removes used tiles from the default set' do
    end
  end

  describe 'tiles_remaining' do
    it 'returns the number of tiles remaining in the bag' do

    end
  end
end
