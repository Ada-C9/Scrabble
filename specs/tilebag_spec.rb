require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/tilebag'

# Get that nice colorized output
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Tilebag' do
  before do
    @tilebag = Scrabble::Tilebag.new
  end
  describe '#init method' do
    it "should be an instance of tilebag" do

      @tilebag.must_be_instance_of Scrabble::Tilebag
    end

    it "should include a collection of default tiles" do

    @tilebag.tiles.must_be_kind_of Hash
    end
  end
end
