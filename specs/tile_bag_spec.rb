require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require 'awesome_print'
require_relative '../lib/tile_bag'

# Get that nice colorized output
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'TileBag' do
  describe 'initialize' do
    it 'correctly initializes a bag of tiles' do
      game_1 = Scrabble::TileBag.new
      game_1.tile_bag[2].must_equal "C" => 2
    end
  end

  describe 'draw_tiles' do
    it 'draws random tiles' do
      game_1 = Scrabble::TileBag.new
      draw_1 = game_1.draw_tiles(3)
      draw_1.length.must_equal 3
    end

    it 'removes random tiles from tile_bag' do
      game_1 = Scrabble::TileBag.new
      sum_control = 98
      draw_1 = game_1.draw_tiles(3)
      sum = 0

      game_1.tile_bag.each do |hash|
        hash.each do |letter, amount|
          sum += amount
        end
      end

      sum.must_equal 95
    end

    describe 'tiles_remaining' do
      it '' do

      end
    end



  end
end
