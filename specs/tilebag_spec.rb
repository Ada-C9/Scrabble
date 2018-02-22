require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/player.rb'
require_relative '../lib/scoring.rb'
require_relative "../lib/tilebag.rb"

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe "TileBag" do
  describe "initialize" do
    it "Should be an instance of class TileBag" do
      Scrabble::TileBag.new.must_be_instance_of Scrabble::TileBag
    end

    it "it should include an array of tiles" do
      new_game = Scrabble::TileBag.new

      new_game.tiles.must_be_kind_of Array
    end

    it "the tile bag must have 98 tiles " do
      new_game = Scrabble::TileBag.new
      new_game.tiles.length.must_equal 98

    end

    it "tile bag must have 6 N´s" do
      new_game = Scrabble::TileBag.new
      new_game.tiles.select{|tile| tile == "N"}.length.must_equal 6
    end

    it "tile bag must have 1 Q´s" do
      new_game = Scrabble::TileBag.new
      new_game.tiles.select{|tile| tile == "Q"}.length.must_equal 1
    end




  end
end
