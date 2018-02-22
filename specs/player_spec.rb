require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/player'
require_relative '../lib/scoring'
require 'pry'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

xdescribe 'Player' do
  describe 'initialize' do
    it "Takes a name" do
      player = Scrabble::Player.new("Paul")

      player.must_respond_to :name
      player.name.must_equal "Paul"
    end
  end

  describe 'plays' do
    it "Returns an array of the words played by the player" do
      player = Scrabble::Player.new("Paul")

      player.play("banana")
      player.play("orange")

      player.plays.must_equal ["banana", "orange"]
    end

    it "Returns an empty array if the player hasn't played" do
        player = Scrabble::Player.new("Paul")

        player.plays.must_equal []
    end
  end

  describe 'play' do
    it "Adds the input word to the `plays` array" do
      player = Scrabble::Player.new("Paul")

      player.play("banana")
      player.play("orange")

      player.plays.include?("banana").must_equal true
      player.plays.include?("orange").must_equal true
      player.plays.length.must_equal 2
    end

    it "Returns `false` if player has already won" do
      player = Scrabble::Player.new("Paul")
      player.play("zzzzzzz")

      player.play("banana").must_equal false
    end

    it "Returns the score of the `word`" do
      player = Scrabble::Player.new("Paul")

      player.play("banana").must_equal 8
    end

    it "Returns ArgumentError if the word is already present" do
        player = Scrabble::Player.new("Paul")

        player.play("banana")

        proc {player.play("banana")}.must_raise ArgumentError
    end

  end

  describe 'total_score' do
    it "Returns the sum of the scores" do
      player = Scrabble::Player.new("Paul")
      player.play("banana")
      player.play("orange")

      player.total_score.must_equal 15
    end

    it "Returns zero if no word was entered" do
      player = Scrabble::Player.new("Paul")

      player.total_score.must_equal 0
    end
  end

  describe 'won?' do
    it "Return true if score is over 100 points" do
      player = Scrabble::Player.new("Paul")
      player.play("zzzzzzz")

      player.won?.must_equal true
    end

    it "Return false if score is under 100 points" do
      player = Scrabble::Player.new("Paul")
      player.play("aaaaaaa")

      player.won?.must_equal false
    end
  end

  describe 'highest_scoring_word' do
    it "Returns the highest scoring played word" do
      player = Scrabble::Player.new("Paul")
      player.play("banana")
      player.play("orange")

      player.highest_scoring_word.must_equal "banana"
    end
  end

  describe 'highest_word_score' do
    it "Returns the highest scoring played word" do
      player = Scrabble::Player.new("Paul")
      player.play("banana")
      player.play("orange")

      player.highest_word_score.must_equal 8
    end
  end

end
