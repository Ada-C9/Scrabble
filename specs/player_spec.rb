require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/player'

# Get that nice colorized output
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Player' do

  describe '#name' do

    it 'returns the instance variable name for instance of Player' do
      angie = Scrabble::Player.new("Angie")
      angie.must_respond_to :name
      angie.name.must_equal "Angie"
    end

  end # describe name

  describe '#plays' do
    it "returns an an empty Array if no words have been played" do
      angie = Scrabble::Player.new("player_six")
      result = angie.plays
      result.must_be_kind_of Array
      result.must_equal []
    end

    it "returns an Array of the words played by the player" do
      robert = Scrabble::Player.new("robert")
      robert.play("first")
      robert.play("second")
      result = robert.plays
      result.must_be_kind_of Array
      result.must_equal ["first", "second"]
    end


  end # describe plays

  describe '#play(word)' do

    it "returns 0 for empty strings and inappropriate characters" do
       debbie = Scrabble::Player.new("debbie")
       debbie.play('').must_equal 0
       debbie.play('$%.982').must_equal 0
    end

    it "adds the input word to the plays Array" do
      maria = Scrabble::Player.new("maria")
      maria.play("academy")
      result = maria.plays
      result.must_equal ["academy"]
    end

    it "returns false if player has already won" do
      edwin = Scrabble::Player.new("edwin")
      edwin.play("qqqq") # 40
      edwin.play("zzzz") # 40
      edwin.play("qzqz") # 40
      result = edwin.play("whatever")
      result.must_equal false
    end

    it "returns the score of the word" do
      mike = Scrabble::Player.new("mike")
      result = mike.play("qqqq")
      result.must_equal 40
    end

  end # describe play(word)

  describe '#total_score' do

    it "returns the sum of scores of played words" do
      steph = Scrabble::Player.new("steph")
      steph.play("qqqq") # 40
      steph.play("zzzz") # 40
      result = steph.total_score
      result.must_equal 80
    end

    it "returns 0 if no words have been played" do
      kyle = Scrabble::Player.new("kyle")
      result = kyle.total_score
      result.must_equal 0
    end

  end # describe total_score

  describe '#won?' do

    it "returns false if the player does not have over 100 points" do
      player_seven = Scrabble::Player.new("player_seven")
      player_seven.play("qqqqq")
      player_seven.play("zzzzz")
      player_seven.won?.must_equal false
    end

    it "returns true if the player has over 100 points" do
      holly = Scrabble::Player.new("holly")
      holly.play("qqqqq")
      holly.play("zzzzz")
      holly.play("a")
      holly.won?.must_equal true
    end

  end # describe won?

  zach = Scrabble::Player.new("Zach")
  zach.play("aei") # 3 points
  zach.play("qqqqq") # 50 points
  zach.play("kai") # 7 point
  chuck = Scrabble::Player.new("chuck")

  describe '#highest_scoring_word' do

    it "returns the highest scoring played word" do
      zach.highest_scoring_word.must_equal "qqqqq"
    end

    it "returns nil if there are no played words" do

      result = chuck.highest_scoring_word
      result.must_be_nil
    end

  end # describe highest_scoring_word

  describe '#highest_word_score' do

    it "returns the score for the highest scoring word" do
      zach.highest_word_score.must_equal 50
    end

    it "returns 0 if there are no played words" do
      result = chuck.highest_word_score
      result.must_equal 0
    end

  end # describe highest_word_score

  describe "#draw_tiles" do
    it "fills the tiles array from the given tilebag" do
      xena = Scrabble::Player.new("xena")
      xena_bag = Scrabble::TileBag.new

      xena.draw_tiles(xena_bag)
      xena.tiles.length.must_equal 7
    end
  end

  describe "#tiles" do
    it "returns an array" do
      aaron = Scrabble::Player.new("aaron")
      aaron.tiles.must_be_kind_of Array
      aaron.tiles.must_equal []
    end
  end


end # describe Player
