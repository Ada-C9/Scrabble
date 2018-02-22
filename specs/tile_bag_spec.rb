require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/tile_bag'


Minitest::Reporters.use!
Minitest::Reporters::SpecReporter.new

describe "TileBag" do
  describe 'initialize' do
    it 'Takes a TileBag collection' do
      tile_bag = Scrabble::TileBag.new({a: 1, b: 2})

      tile_bag.must_be_instance_of Scrabble::TileBag
      tile_bag.must_respond_to :bag
      tile_bag.bag.must_be_kind_of Hash
      tile_bag.must_equal ({a: 1, b: 2})

    end

  end



end
