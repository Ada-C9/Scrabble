require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/player'

# Get that nice colorized output
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Player' do
  describe 'name' do
    it 'returns the value of the @name instance variable' do
      ada = Scrabble::Player.new("Ada")
      ada.name.must_equal "Ada"
    end
  end

  describe 'plays' do
    it 'returns an Array of the words played by the player' do
      ada = Scrabble::Player.new("Ada")
      ada.play("apple")
      ada.play("cat")
      ada.plays.must_equal(["apple", "cat"])
    end
  end

  describe 'play(word)' do
    it 'adds the input word to the plays array' do
      ada = Scrabble::Player.new("Ada")
      ada.play("apple")
      ada.plays.must_include("apple")
    end

    it 'prevents a player who has won from playing' do
      ada = Scrabble::Player.new("Ada")
      ada.play("apple")
      ada.play("kale")
      ada.play("cashew")
      ada.play("banana")
      ada.play("tomato")
      ada.play("avocado")
      ada.play("cat").must_equal(false)
    end

    it "returns the score of the word that is played if the player hasn't won" do
      ada = Scrabble::Player.new("Ada")
      ada.play("apple").must_equal(9)
    end

    it "if you already won it doesn't add word to array" do
      ada = Scrabble::Player.new("Ada")
      ada.play("apple")
      ada.play("kale")
      ada.play("cashew")
      ada.play("banana")
      ada.play("tomato")
      ada.play("avocado")
      ada.play("cat").must_equal false
    end

    it "updates the total score after playing word" do
      ada = Scrabble::Player.new("Ada")
      ada.play("beets")
      puts ada.total_score
    end
  end #ends describe 'play(word)'

  describe 'tiles' do
    it 'holds 7 tiles the first time a player draws tiles' do
      ada = Scrabble::Player.new("Ada")
      game_tiles = Scrabble::TileBag.new
      ada.draw_tiles(game_tiles)
      ada.tiles.length.must_equal(7)
    end
  end

  describe 'draw_tiles(tile_bag)' do
    it 'fills tiles array until it has 7 letters from the given tile bag' do
      ada = Scrabble::Player.new("Ada")
      game_tiles = Scrabble::TileBag.new
      ada.tiles.pop
      ada.tiles.pop
      ada.tiles.pop
      ada.draw_tiles(game_tiles)
      ada.tiles.length.must_equal(7)
    end
  end

end #ends Player do
