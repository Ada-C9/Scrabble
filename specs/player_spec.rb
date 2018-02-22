require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/player'

# Get that nice colorized output
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Player' do
  before do
    @player = Scrabble::Player.new("maja")
  end

  describe 'initialize' do
    it 'takes player name' do

      @player.must_respond_to :name
      @player.name.must_be_kind_of String

      @player.must_respond_to :won
      @player.winner.must_equal false
    end
    it 'plays returns an array of words' do
      player = Scrabble::Player.new("maja")

      player.plays.must_be_instance_of Array
      player.plays.length.must_equal 0
    end
  end

  describe 'play method' do
    it 'takes a word and add it to an array' do
      word = "cookie"
      @player.play(word)
      @player.plays.include? word
    end
    it 'returns the score of a player' do

      @player.play('cookie').must_equal 12
    end
  end

  xdescribe 'total_score method' do
    it '' do

    end
  end

  xdescribe 'highest_scoring word' do
    it '' do

    end
  end

  xdescribe 'highest_word_score' do
    it '' do

    end
  end

  xdescribe 'won method' do
    it '' do

    end
  end
end
