require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/player'

# Get that nice colorized output
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Player' do
  describe 'initialize' do
    it 'takes a player_name' do
      player_name = "Ari"

      player = Scrabble::Player.new(player_name)

      player.must_respond_to :name
      player.name.must_equal "Ari"
      player.name.must_be_kind_of String
    end
  end

  describe 'play' do
    it 'returns the score of a valid word' do
      player = Scrabble::Player.new("Ari")

      player.play('dog').must_equal 5
      player.play('academy').must_equal 65
    end

    it 'returns nil for an invalid word' do
      player = Scrabble::Player.new("Ari")
      player.play('char^').must_be_nil
      player.play(' ').must_be_nil
    end

    it 'returns false if the player has 100 points' do
      player = Scrabble::Player.new("Ari")
      # pass words to .play to reach @total_score = 100
      player.play('squeeze')
      player.play('quezals')
      player.play('squiffy')
      player.play('quickly')
      player.play('dog').must_equal false
    end

    it 'returns false if the player has < 100 points' do
      player = Scrabble::Player.new("Ari")
      # pass word to .play to reach @total_score < 100
      player.play('cat')
      player.play('dog').must_equal 5
    end

    it 'returns score if the player > 100 points' do
      player = Scrabble::Player.new("Ari")
      # pass word to .play to reach @total_score > 100
      player.play('squeeze')
      player.play('quezals')
      player.play('squiffy')
      player.play('zombify')
      player.play('dog').must_equal false
    end

    it 'adds the word to plays array' do
      player = Scrabble::Player.new("Ari")
      player.play('dog')
      player.plays.must_equal ["dog"]
    end

    it 'keeps track of all words in plays array' do
      player = Scrabble::Player.new("Ari")
      player.play('cat')
      player.play('mouse')
      player.play('dog')
      player.plays.must_equal ["cat", "mouse", "dog"]
    end
  end

end
