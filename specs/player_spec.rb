require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require 'pry'

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

    it 'must return accurate words' do
      new_player = Scrabble::Player.new("Tor")
      new_player.play('qqqqq')
      new_player.play('giraffe')
      new_player.plays.must_equal ['qqqqq','giraffe']
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
      new_player.play('giraffe')
      new_player.play('asd').must_equal false
    end

    it 'returns the score of the word' do
      word = "giraffe"
      score = 64

      new_player = Scrabble::Player.new("Angela")
      new_player.play(word).must_equal score
    end

  end

  describe 'Scrabble::Player.total_score' do
    it 'returns the sum of scores of played words' do
      new_player = Scrabble::Player.new("Angela")
      new_player.play('qqqqq')
      new_player.play('giraffe')
      new_player.total_score.must_equal 114
    end
  end

  describe 'Scrabble::Player.won?' do
    it 'returns false until player has over 100 points' do
      new_player = Scrabble::Player.new("Angela")
      new_player.play('qqqqq')
      new_player.won?.must_equal false
      new_player.play('giraffe')
      new_player.won?.must_equal true
    end
  end

  #nominal
    describe 'Scrabble::Player.won?' do
      it 'returns false until player has over 100 points' do
        new_player = Scrabble::Player.new("Angela")
        new_player.play('qqqqq')
        new_player.play('zzzzz')
        new_player.won?.must_equal false
      end
    end

  describe 'Scrabble::Player.highest_scoring_word' do
    it 'returns the highest scoring played word' do
      new_player = Scrabble::Player.new("Tor")
      new_player.play("baboon")
      new_player.play("giraffe")
      new_player.play("cat")

      new_player.highest_scoring_word.must_equal "giraffe"
    end
  end

  describe 'Scrabble::Player.highest_word_score' do
    it 'returns the highest scoring word score' do
      new_player = Scrabble::Player.new("Angela")
      new_player.play("baboon")
      new_player.play("giraffe")
      new_player.play("cat")

      new_player.highest_word_score.must_equal 64
    end

    it 'returns nil if no word has been played' do
      new_player = Scrabble::Player.new("Angela")
      new_player.highest_word_score.must_be_nil
    end
  end

  describe 'Scrabble::Player#tiles' do
    it 'returns an array of tiles' do
      new_player = Scrabble::Player.new("Angela")
      new_player.tiles.must_be_kind_of Array
    end

  end

  describe 'Scrabble::Player#draw_tiles' do
    it 'must repopulate the tiles array until length is MAX_WORD_LENGTH'do
      new_player = Scrabble::Player.new("Angela")
      # tilebag = Scrabble::TileBag.new
      new_player.draw_tiles(Scrabble::Player.tilebag)
      new_player.tiles.length.must_equal Scrabble::MAX_WORD_LENGTH
    end

  end

end

binding.pry
