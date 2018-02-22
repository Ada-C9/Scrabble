require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/player'
require_relative '../lib/scoring'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Player' do

  before do
    @john = Scrabble::Player.new("John")
    @sally = Scrabble::Player.new("Sally")
  end

  describe 'initialize' do
    it 'Takes in a name' do
      @john.must_respond_to :name
      @john.name.must_equal "John"
      @john.name.must_be_kind_of String
    end

    it 'returns an array' do
      @john.plays.must_be_kind_of Array
      @john.plays.must_equal []
    end
  end

  describe 'play' do
    it 'takes in a word' do
      @john.must_respond_to :play
    end

    it 'word is added to play array' do
      @john.play("snail")
      @john.plays.must_include "snail"
    end

    xit 'returns false if game is over (player has already won)' do

    end

    it 'returns score of word' do
      @john.play("snail").must_equal 5
      @john.play("snail").must_be_kind_of Integer
    end
  end

  describe 'total_score' do
    it 'returns sum of played words'
    @john.play("board")
    @john.play("cup")

    @john.total_score.must_equal 15
  end

end
