require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/player'
require_relative '../lib/tilebag'

# Get that nice colorized output
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
  end

  describe 'plays' do
    it 'return an attribute of a list of player words' do
      name = 'BamBam'
      player = Scrabble::Player.new(name)

      all_plays = player.plays

      all_plays.must_be_kind_of Array
      player.must_respond_to :plays
    end
  end

  describe 'play(word)' do
    it 'adds input word to plays array' do
      name = 'BamBam'
      player = Scrabble::Player.new(name)
      word = "GHOST"

      player.play(word)

      player.plays.include?("GHOST").must_equal true
    end

    it 'return the score of the provided word' do
      name = 'BamBam'
      player = Scrabble::Player.new(name)
      word = "ferret"

      word_score = player.play(word)

      word_score.must_equal 9
    end

    it 'returns false if player has won' do
      name = 'BamBam'
      player = Scrabble::Player.new(name)
      winning_words = ["glitter", "jittery"]

      winning_words.each { |word| player.play(word) }

      player.play('beam').must_equal false
    end

    it 'does not add invalid input for word' do
      name = 'BamBam'
      player = Scrabble::Player.new(name)
      bad_word = nil

      player.play(bad_word)

      player.plays.include?(bad_word).must_equal false
    end

  end

  describe 'total_score' do
    it 'returns sum of all players word scores' do
      name = 'BamBam'
      player = Scrabble::Player.new(name)
      words = ["ghost", "ferret", "litter"]

      words.each { |word| player.play(word) }
      score_sum = player.total_score

      player.must_respond_to :total_score
      score_sum.must_equal 24
    end
  end

  describe 'won?' do
    it 'returns true if player has a total score > 100' do
      name = 'BamBam'
      player = Scrabble::Player.new(name)
      words = ["glitter", "jittery"]

      words.each { |word| player.play(word) }

      player.won?.must_equal true
    end

    it 'returns true if player has a total score equals 100' do
      name = 'BamBam'
      player = Scrabble::Player.new(name)
      words = %w[quiz letter dean jittery]

      words.each { |word| player.play(word) }

      player.won?.must_equal true
    end

    it 'returns false if player has a total score < 100' do
      name = 'BamBam'
      player = Scrabble::Player.new(name)

      player.play("glitter")

      player.won?.must_equal false
    end

  end

  describe 'highest_scoring_word' do
    it 'returns players highest scoring word' do
      name = 'BamBam'
      player = Scrabble::Player.new(name)
      words = %w[quiz letter dean jittery]
      words.each { |word| player.play(word) }

      best_word = player.highest_scoring_word

      best_word.must_equal 'jittery'
    end
  end

  describe 'highest_word_score' do
    it 'returns highest scoring word score' do
      name = 'BamBam'
      player = Scrabble::Player.new(name)
      words = %w[quiz letter dean jittery]
      words.each { |word| player.play(word) }

      best_word_score = player.highest_word_score

      best_word_score.must_equal 67
    end
  end

  describe 'tiles' do
    it 'has a collection of tile_bag' do
      name = 'BamBam'
      player = Scrabble::Player.new(name)

      player.must_respond_to :tiles
      player.tiles.must_be_kind_of Array
      player.tiles.size.must_equal 0
    end
  end

  describe 'draw_tiles' do
    it 'fill tile bag until it has seven tiles' do
      name = 'BamBam'
      player = Scrabble::Player.new(name)
      tile_bag = Scrabble::TileBag.new
      player.draw_tiles(tile_bag)

      player.tiles.size.must_equal 7
    end

    it 'number of tiles drawn does not exceed 7' do
      name = 'BamBam'
      player = Scrabble::Player.new(name)
      tile_bag = Scrabble::TileBag.new
      player.draw_tiles(tile_bag)
    end

    it 'throws ArgumentError if provided something other than a TileBag' do
      name = 'BamBam'
      player = Scrabble::Player.new(name)
      assert_raises{player.draw_tiles("I am the TileBag")}

    end

  end


# "zip", "quill", "quite", "zebra", "quail", "flitter",

end
