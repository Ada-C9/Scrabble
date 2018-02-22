require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/tilebag'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'TileBag' do
  let(:tilebag) {Scrabble::TileBag.new}
  describe '#initialize' do
    it 'Should set up the instance with a collection of all default tiles' do
      tilebag.must_be_instance_of Array
      tilebag.length.must_equal 98
    end

    it 'confirms correct number of tiles in tilebag'
      tilebag.tiles.select {|tile| tile == 'A'}.must_equal 9
      tilebag.tiles.select {|tile| tile == 'B'}.must_equal 2
    end
  end

end
