require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require 'pry'
require_relative '../lib/tile-bag'

# Get that nice colorized output
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'TileBag' do

  describe "initialize" do

    it 'should contain initial number of tiles' do

      Scrabble::TileBag.new.tiles_remaining.must_equal 98

    end

    it 'should have initial distribution of letters' do
      Scrabble::TileBag.new.tile_bag.must_be_kind_of Hash

      Scrabble::TileBag.new.tile_bag["A"].must_equal 9
      Scrabble::TileBag.new.tile_bag["N"].must_equal 6
      Scrabble::TileBag.new.tile_bag["Z"].must_equal 1
    end
  end

  describe "draw_tiles" do
    it 'return collection of random tiles' do


      Scrabble::TileBag.new.draw_tiles(7).must_be_kind_of Array

      Scrabble::TileBag.new.draw_tiles(7).each do |tile|
        tile.must_be_kind_of String
      end

    end

    it 'removes tiles from the default set' do
      turn = Scrabble::TileBag.new
      turn.draw_tiles(7)
      turn.tiles_remaining.must_equal 91
    end

  end


end #end of tests
