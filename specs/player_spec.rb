require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/player'
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new


describe 'Player' do

  describe 'name' do
    it 'returns the value of the @name instance variable' do
      player_name = Scrabble::Player.new ("Ada")
      player_name.name.must_equal "Ada"
    end
  end

  describe 'plays' do
    it 'returns an Array' do
      player_name = Scrabble::Player.new ("Ada")
      player_name.plays.must_be_instance_of Array
    end

  end

  describe 'play' do
    it 'adds the word into the array of words' do
      player_name = Scrabble::Player.new ("Ada")
      player_name.play("pop")

      player_name.plays.must_include "pop"
    end

    it 'Returns false if player has already won' do
      player_name = Scrabble::Player.new ("Ada")
      player_name.play("ZZZZZZZ")
      ####
      must_be_false = player_name.play("POP")
      must_be_false.must_equal false

    end

    # it 'Otherwise returns the score of the word' do
    #
    #end

  end

  describe 'total_score' do
    player_name = Scrabble::Player.new ("Ada")
    player_name.play("pop")
    player_name.play("lawl")
    total_score.must_be "14"

  end
  #
  # describe 'won?' do
  # end
  #
  # describe 'highest_scoring_word' do
  # end
  #
  # describe 'highest_word_score' do
  # end
end
