# Kaitlin Forsman and Kirsten Schumy
# Ada Cohort[9], Ampers
# Scrabble Assignment

require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/player'
require_relative '../lib/tilebag'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Player' do

  describe 'initialize' do
    it 'initializes with a name' do
      name = 'Bashful'
      player = Scrabble::Player.new(name)
      player.must_be_kind_of Scrabble::Player
      player.must_respond_to :name
      player.name.must_equal 'Bashful'
    end

    it 'has default name value if provided empty String' do
      name = "    "
      player = Scrabble::Player.new(name)
      player.must_be_kind_of Scrabble::Player
      player.name.must_equal 'AnnoyingOne'
    end

    it 'has default name value if provided non-String' do
      name = nil
      player = Scrabble::Player.new(name)
      player.must_be_kind_of Scrabble::Player
      player.name.must_equal 'AnnoyingOne'
    end

    it 'initializes with plays' do
      player = Scrabble::Player.new('BamBam')
      player.must_respond_to :plays
      player.plays.must_be_kind_of Array
      player.plays.must_equal []
    end

    it 'initializes with total_score' do
      player = Scrabble::Player.new('BamBam')
      player.must_respond_to :total_score
      player.total_score.must_be_kind_of Integer
      player.total_score.must_equal 0
    end

    it 'initializes with tiles' do
      player = Scrabble::Player.new('BamBam')
      player.must_respond_to :tiles
      player.tiles.must_be_kind_of Array
      player.tiles.must_equal []
    end

  end

  describe 'plays' do
    it 'stores words' do
      player = Scrabble::Player.new('BamBam')
      player.plays.must_equal []
      player.play("PUDDLE")
      player.plays.must_equal ["PUDDLE"]
    end

    it 'stores more than one of the same word' do
      player = Scrabble::Player.new('BamBam')
      2.times { player.play("PUDDLE") }
      player.plays.must_equal ["PUDDLE", "PUDDLE"]
    end

    it 'does not stores invalid words' do
      player = Scrabble::Player.new('BamBam')
      proc { player.play("HELLOWORLD") }.must_raise ArgumentError
      player.plays.must_equal []
    end
  end

  describe 'play(word)' do
    it 'adds input word to plays array' do
      player = Scrabble::Player.new('BamBam')
      player.play("GHOST")
      player.plays.include?("GHOST").must_equal true
    end

    it 'return the score of the provided word' do
      player = Scrabble::Player.new('BamBam')
      player.play("ferret").must_equal 9
    end

    it 'returns false if player has won' do
      player = Scrabble::Player.new('BamBam')
      ["glitter", "jittery"].each { |word| player.play(word) }
      player.play('beam').must_equal false
    end

    it 'does not add invalid input for word' do
      player = Scrabble::Player.new('BamBam')
      proc { player.play(nil) }.must_raise ArgumentError
      player.plays.include?(nil).must_equal false
    end
  end

  describe 'total_score' do
    it 'returns sum of all players word scores' do
      player = Scrabble::Player.new('BamBam')
      ["ghost", "ferret", "litter"].each { |word| player.play(word) }
      player.must_respond_to :total_score
      player.total_score.must_equal 24
    end
  end

  describe 'won?' do
    it 'returns true if player has a total score > 100' do
      player = Scrabble::Player.new('BamBam')
      ["glitter", "jittery"].each { |word| player.play(word) }
      player.total_score.must_be :>, 100
      player.won?.must_equal true
    end

    it 'returns true if player has a total score equals 100' do
      player = Scrabble::Player.new('BamBam')
      %w[quiz letter dean jittery].each { |word| player.play(word) }
      player.total_score.must_equal 100
      player.won?.must_equal true
    end

    it 'returns false if player has a total score < 100' do
      player = Scrabble::Player.new('BamBam')
      player.play("glitter")
      player.total_score.must_be :<, 100
      player.won?.must_equal false
    end
  end

  describe 'highest_scoring_word' do
    it 'returns players highest scoring word' do
      player = Scrabble::Player.new('BamBam')
      %w[quiz letter dean jittery].each { |word| player.play(word) }
      player.highest_scoring_word.must_equal 'jittery'
    end

  end

  describe 'highest_word_score' do
    it 'returns highest scoring word score' do
      player = Scrabble::Player.new('BamBam')
      %w[quiz letter dean jittery].each { |word| player.play(word) }
      player.highest_word_score.must_equal 67
    end
  end

  describe 'draw_tiles' do
    it 'fill tile bag until it has seven tiles' do
      player = Scrabble::Player.new('BamBam')
      tile_bag = Scrabble::TileBag.new
      player.tiles.size.must_equal 0
      player.draw_tiles(tile_bag)
      player.tiles.size.must_equal 7
    end

    it 'does not fill tiles beyond 7' do
      player = Scrabble::Player.new('BamBam')
      tile_bag = Scrabble::TileBag.new
      player.draw_tiles(tile_bag)
      player.tiles.size.must_equal 7
      player.draw_tiles(tile_bag)
      player.tiles.size.must_equal 7
    end

    it 'throws ArgumentError if provided something other than a TileBag' do
      player = Scrabble::Player.new('BamBam')
      assert_raises{ player.draw_tiles("Look at me. I am the TileBag now.") }
    end
  end
  
end
