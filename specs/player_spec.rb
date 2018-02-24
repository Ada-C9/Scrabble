require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require 'pry'

require_relative '../lib/player'

# Get that nice colorized output
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Player' do

  before do
    @player_1 = Scrabble::Player.new("Nora")
    @player_2 = Scrabble::Player.new("Bertram")
  end

  describe 'initialize' do

    it "Takes a player name" do
      @player_1.name.must_equal "Nora"
    end

  end

  describe 'play(word)' do

    it "Adds the input word to the plays array" do

      @player_1.play("walri")
      @player_1.plays.must_include "walri"
      @player_1.plays.must_be_kind_of Array

    end

    it "Returns false if player has already won" do
      @player_2.plays = ["pizzazz", "bezique"]
      @player_2.won?

      @player_2.play("snart").must_equal false
    end

    it "Returns score of word if player has not already won" do
      @player_2.plays = ["were", "wolf", "bar", "mitzva"]

      @player_2.play("snart").must_equal true
    end

  end

  describe 'total_score' do

    it "Returns the sum of scores of played words" do
      @player_1.plays = ["grawlix", "butter", "bacon"]

      @player_1.total_score.must_equal 85
    end

  end

  describe 'won?' do

    it "Returns true if the player has over 100 points" do
      @player_2.plays = ["pizzazz", "bezique"]

      @player_2.won?.must_equal true
    end

    it "Returns false if player has less than 100 points" do
      @player_2.plays = ["were", "wolf", "bar", "mitzva"]

      @player_2.won?.must_equal false

    end

    it "Returns false if player has exactly 100 points" do
      @player_2.plays = ["jalopy", "banjax", "pyjama", "enzyme", "quiche"]

      @player_2.won?.must_equal false

    end

  end

  describe 'highest_scoring_word' do

    it "Returns the highest scoring played word" do
      @player_2.plays = ["jalopy", "banjax", "pyjama", "enzyme", "quiche"]
      @player_2.highest_scoring_word.must_equal "banjax"
    end
  end

  describe 'highest_word_score' do

    it "Returns the highest_scoring_word score" do
      @player_2.plays = ["bezique", "pizzazz"]
      @player_2.highest_scoring_word
      @player_2.highest_word_score.must_equal 95
    end

  end

  describe "tiles" do
    it "holds a collection of up to seven tiles" do
      test_tiles = @player_1.tiles

      test_tiles.must_be_kind_of Array
    end
  end

  describe "draw_tiles(tile_bag)" do

    before do
      full_tile_set = {
        :A => 9, :N => 6, :B => 2, :O => 8, :C => 2,
        :P => 2, :D => 4, :Q => 1, :E => 12, :R => 6,
        :F => 2, :S => 4, :G => 3, :T => 6, :H => 2,
        :U => 4, :I => 9, :V => 2, :J => 1, :W => 2,
        :K => 1, :X => 1, :L => 4, :Y => 2, :M => 2,
        :Z => 1
      }
      @full_tile_bag_instance = Scrabble::TileBag.new(full_tile_set)

      limited_tile_set = {
        :A => 0, :N => 0, :B => 0, :O => 0, :C => 0,
        :P => 0, :D => 0, :Q => 1, :E => 0, :R => 0,
        :F => 0, :S => 0, :G => 0, :T => 0, :H => 0,
        :U => 0, :I => 0, :V => 0, :J => 0, :W => 0,
        :K => 0, :X => 1, :L => 0, :Y => 0, :M => 0,
        :Z => 1
      }
      @limited_tile_bag_instance = Scrabble::TileBag.new(limited_tile_set)

    end

    it "draws the correct number of tiles when there are plentiful tiles" do
        player = Scrabble::Player.new("Grizz")
        player.tiles = [:A,:B]
        player.draw_tiles(@full_tile_bag_instance)

        player.tiles.length.must_equal 7
    end

    it "draws the correct number of tiles whem there are non-plentiful tiles" do

      player = Scrabble::Player.new("Dotcom")
      player.tiles = [:D]
      player.draw_tiles(@limited_tile_bag_instance)
      player.tiles.length.must_equal 4
    end

  end
end
