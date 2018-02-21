require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/player.rb'
require_relative '../lib/scoring.rb'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'class player' do
  describe 'initialize method' do
    it 'returns name from instance variable @name' do
      new_name = Scrabble::Player.new("Tor")
      new_name.must_respond_to :name
      new_name.name.must_equal "Tor"
    end
  end

  describe 'Scrabble::Player.plays' do
    it 'must return an array of played words' do
      new_player = Scrabble::Player.new("Angela")
      new_player.plays.must_be_kind_of Array
    end
  end

  describe 'Scrabble::Player.play' do
    it 'takes in a string as input' do
      new_player = Scrabble::Player.new("Tor")
      before_played = new_player.plays.length

      new_player.play("giraffe")
      after_played = new_player.plays.length
      after_played.must_equal before_played + 1
    end

    it 'returns false if player has already won' do
      new_player = Scrabble::Player.new("Tor")
      new_player.play('qqqqq')
      puts new_player.points
      new_player.play('giraffe')
        puts new_player.points
      new_player.play('asd').must_equal false
    end

    it 'returns the score of the word' do
      word = "giraffe"
      score = 64

      new_player = Scrabble::Player.new("Angela")
      new_player.play(word).must_equal score
    end

  end

end
