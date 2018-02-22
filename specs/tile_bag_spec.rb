require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/tile_bag'
require 'pry'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'TileBag' do

  describe 'initialize' do
    it "Set-up the instance with a collection of all default tiles" do
      tile_bag = Scrabble::TileBag.new

      tile_bag.must_respond_to :tiles
      tile_bag.tiles.must_be_instance_of Array    
    end

  end

  describe 'draw_tiles' do

  end

  describe 'tiles_remaining' do

  end

end
