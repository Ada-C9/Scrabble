require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/tilebag'

# Get that nice colorized output
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Tilebag' do
  describe 'draw tiles' do
    it 'draws the number of tiles passed in as an argument' do
      game_1_tiles = Scrabble::TileBag.new
      result = game_1_tiles.draw_tiles(5)
      result.length.must_equal(5)
    end

    it 'does not draw if the number passed in is 0' do
      game_1_tiles = Scrabble::TileBag.new
      result = game_1_tiles.draw_tiles(0)
      result.length.must_equal(0)
    end
  end

  describe 'tiles remaining' do
    it 'updates the number of tiles remaining after tiles are drawn' do
      game_1_tiles = Scrabble::TileBag.new
      game_1_tiles.draw_tiles(1)
      game_1_tiles.tiles_remaining.must_equal(97)
    end

    # it 'decrements the amount of letters remaining for a letter tile that is drawn' do
      #implement in future
    # end

  end

end
