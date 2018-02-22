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

    it 'continues to play if the player has 100 points' do
      player = Scrabble::Player.new("Ari")
      # pass words to .play to reach @total_score = 100
      player.play('squeeze')
      player.play('happy')
      player.play('purple')
      player.player_score.must_equal 100
      player.play('dog').must_equal 5
    end

    it 'returns false if the player has < 100 points' do
      player = Scrabble::Player.new("Ari")
      # pass word to .play to reach @total_score < 10
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
  end

  describe 'words in plays array' do
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

    it 'returns plays even when word is invalid' do
      player = Scrabble::Player.new("Ari")
      player.play('oxyphenbutazone')
      player.plays.must_equal ['oxyphenbutazone']
    end
  end
# testing the players score
  describe 'running score as player_score' do
    it 'calculates score with one play' do
      player = Scrabble::Player.new("Ari")
      player.play('cat')
      player.player_score.must_equal 5
    end

    it 'calculates score with multiple plays' do
      player = Scrabble::Player.new("Ari")
      player.play('cat')
      player.play('mouse')
      player.play('dog')
      player.player_score.must_equal 17
    end

    it 'provides score even when word is invalid' do
      player = Scrabble::Player.new("Ari")
      player.play('mouse')
      player.play('oxyphenbutazone')
      player.player_score.must_equal 7
    end

    it 'provides 0 even when word is invalid' do
      player = Scrabble::Player.new("Ari")
      player.play('oxyphenbutazone')
      player.player_score.must_equal 0
    end
  end

  describe 'winning' do
    it 'returns true if the player has > 100 points' do
      player = Scrabble::Player.new("Ari")

      player.play('squeeze')
      player.play('quezals')
      player.play('squiffy')
      player.play('zombify')
      player.won?.must_equal true
    end

    it 'returns false if the player has < 100 points' do
      player = Scrabble::Player.new("Ari")

      player.play('cat')
      player.play('dog')
      player.won?.must_equal false
    end

    it 'returns false if the player has 100 points' do
      player = Scrabble::Player.new("Ari")

      player.play('squeeze')
      player.play('happy')
      player.play('purple')
      player.won?.must_equal false
    end

    it 'returns false if the player has very few points' do
      player = Scrabble::Player.new("Ari")

      player.play('an')
      player.won?.must_equal false
    end

    describe 'highest scoring word' do
      it 'returns the highest scoring word with one word' do
        player = Scrabble::Player.new("Ari")
        player
      end
      it 'returns the highest scoring word with multiple words' do

      end
      it 'returns the highest scoring word with no valid words' do

      end
    end

  end
end
