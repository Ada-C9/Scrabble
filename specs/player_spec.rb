require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require 'awesome_print'
require_relative '../lib/player'

# Get that nice colorized output
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Player' do
  describe 'initialize' do
    it 'can initialize new player' do
      player = Scrabble::Player.new("Abbinet")

      player.must_be_kind_of Scrabble::Player
      player.name.must_equal "Abbinet"
    end
  end

  describe 'play(word)' do
    it 'adds word to @plays array' do
      play_1 = Scrabble::Player.play("ada")
      @plays.must_equal ["ada"]
    end

    it 'returns false if player has already won' do

    end

    it 'returns the score of the word' do
      play_1 = Scrabble::Player.play("ada")
      play_1.play.must_equal 4
    end

  end

  describe 'total_score' do
    it '' do

    end
  end

  describe 'won' do
    it '' do

    end
  end

  describe 'highest_scoring_word' do
    it '' do

    end
  end

  describe 'highest_word_score' do
    it '' do

    end
  end


end
