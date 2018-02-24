require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/tilebag'

# Get that nice colorized output
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

xdescribe 'TileBag' do

  describe '#initialize' do

    it 'starts all of the default tiles' do
      tilebag = Scrabble::TileBag.new
      tilebag.tiles.must_be_kind_of Array

      tilebag.tiles.each do |tile|
        tile.must_be_kind_of String
        tile.length.must_equal 1
      end
      # tilebag.tiles.length.must_equal 98
    end

  end

end describe 'TileBag'
