require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require 'pry'
require_relative '../lib/player'


# Get that nice colorized output
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Player' do

  describe "name" do

    it 'gets a name' do
      Scrabble::Player.new("Chihiro").must_be_kind_of Scrabble::Player
      Scrabble::Player.new("Haku").name.must_be :==,"Haku"
      Scrabble::Player.new().name.must_equal "No Face"
    end
  end

  describe "plays" do

    it 'returns an array of words' do
      # haku = Scrabble::Player.new("Haku")
      # array = ["Haku", "dust bunnies"]


      Scrabble::Player.new.plays.must_be_kind_of Array

      # haku.@plays(array)
      # haku.plays[0].must_be_kind_of String
    end
  end

  describe 'play(word)' do
    before do
    @first_player = Scrabble::Player.new("Yubaba")
    end
    it 'adds input to plays array' do
      @first_player.play("dragon")
      @first_player.plays.must_include "dragon"
      #binding.pry
    end

    it 'returns false if player has already won' do
      @first_player.total_score = 110
      @first_player.play("rice").must_equal false
      #binding.pry
    end

    it 'returns the score of the word' do #if player didn't win
      @first_player.play("dragon").must_equal 8
      @first_player.play("dog").must_equal 5
      @first_player.plays.must_equal ["dragon", "dog"]
      @first_player.total_score.must_equal 13
    end
  end

  describe 'highest_scoring_word' do
    before do
    @first_player = Scrabble::Player.new("Yubaba")
    end
    it 'returns the highest scoring played word' do
      @first_player.play("dragon")
      @first_player.play("dog")

      @first_player.highest_scoring_word.must_equal "DRAGON"
    end
  end

  describe 'highest_word_score' do
    before do
    @first_player = Scrabble::Player.new("Yubaba")
    end

    it 'returns the highest_scoring_word score' do
      @first_player.play("dragon")
      @first_player.play("dog")

      @first_player.highest_word_score.must_equal 8
    end


  end

  describe "gets tiles" do
    it "is a collection of tiles with a max of 7 letters" do

      Scrabble::Player.new.tiles.must_be_kind_of Array

      Scrabble::Player.new.tiles.length.must_be:<,8

    end
  end



  describe "draw_tiles(tile_bag)" do
    #a_player = Scrabble::Player.new("Kamaji")

    it 'fills tile array until it has 7 letters from tile bag' do

    end
  end




end # end of all tests
