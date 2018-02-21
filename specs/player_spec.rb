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
      player = Scrabble::Player.new("Abinnet")
      player.must_be_instance_of Scrabble::Player
      player.name.must_equal "Abinnet"
    end
  end

  describe 'play(word)' do
    it 'adds word to @plays array' do
      player_1 = Scrabble::Player.new("lily")
      player_1.play("ada")
      player_1.plays.must_equal ["ADA"]
    end

    it 'returns false if player has already won' do
      player_1 = Scrabble::Player.new("lily")
      player_1.play("zzzzqqz")
      player_1.play("fff").must_equal false

    end

    it 'returns the score of the word' do
      player_1 = Scrabble::Player.new("lily")
      player_1.play("ada").must_equal 4
    end
  end

  # describe 'total_score' do
  #   it '' do
  #
  #   end
  # end
  #
  # describe 'won' do
  #   it '' do
  #
  #   end
  # end
  #
  # describe 'highest_scoring_word' do
  #   it '' do
  #
  #   end
  # end
  #
  # describe 'highest_word_score' do
  #   it '' do
  #
  #   end
  # end


end
