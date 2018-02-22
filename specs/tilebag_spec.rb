require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/tilebag.rb'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'tilebag class' do
  describe 'initialize method' do
    it 'TileBag.new creates a new instance' do
      new_bag = Scrabble::TileBag.new

      new_bag.must_be_instance_of Scrabble::TileBag
    end
  end

  describe 'draw_tiles method' do
    it 'can return the right number of tiles requested' do
      new_bag = Scrabble::TileBag.new
      new_bag.draw_tiles(3).must_be_kind_of Array
      new_bag.draw_tiles(3).length.must_equal 3
    end
  end
end
