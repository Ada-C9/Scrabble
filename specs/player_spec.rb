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

  describe 'tiles' do
    it 'is a collection of letters that the player can play (max 7)' do
      # player = Scrabble::Player.new ("Ada")
      # player.tiles.must_be_instance_of Array
      # player.tiles.length.must_equal 0
      ##player_name.tiles.length.must_be :<, 8
    end
  end

  describe 'draw_tiles' do
   it 'fills tiles array until it has 7 letters from the given tile bag' do
     # player = Scrabble::Player.new ("Ada")
     # tile_bag_test = Scrabble::TileBag.new
     # player.draw_tiles(tile_bag_test)
     # player.tiles.length.must_equal 7
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

    it 'Otherwise returns the score of the word' do
      player_name = Scrabble::Player.new ("Ada")
      must_return_word = player_name.play("lawl")
      must_return_word.must_equal 7
    end

  end

  describe 'total_score' do
    it 'Returns a total score to the user' do
      player_name = Scrabble::Player.new("Ada")
      player_name.play('hi')
      player_name.play('bye')
      player_name.play('cry')
      player_name.play('why')
      player_name.total_score.must_equal 33
    end
  end

  describe 'won?' do
    it 'Returns true if player has won' do
      player_name = Scrabble::Player.new ("Ada")
      player_name.play("ZZZZZZZ")
      player_name.won?.must_equal true
    end

    it 'Returns false if player has not won' do
      player_name = Scrabble::Player.new ("Ada")
      player_name.play("pop")
      player_name.play("lawl")
      player_name.won?.must_equal false
    end

  end
  #
  describe 'highest_scoring_word' do
    it 'Returns highest scoring word in an array of words for a single player' do
      player_name = Scrabble::Player.new("Ada")
      player_name.play('hi')
      player_name.play('bye')
      player_name.play('cry')
      player_name.play('why')

      player_name.highest_scoring_word.must_equal 'why'
    end
  end

  describe 'highest_word_score' do
    it "Returns the score of the highest scoring word" do
      player_name = Scrabble::Player.new("Ada")
      player_name.play('hi')
      player_name.play('bye')
      player_name.play('cry')
      player_name.play('ZZZZZZZ')

      player_name.highest_word_score.must_equal 120
    end
  end
end
