require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/player'

describe "Scrabble Player" do
  let(:player) { Scrabble::Player.new("Anonymous")}
  describe "#initialize" do
    it "validates and instantiates the name instance variable" do
      player.must_respond_to :name
      player.name.must_be_instance_of String
      player.name.must_equal "Anonymous"
    end
    it "#plays returns an Array of the words played by the player" do
      player.must_respond_to :plays
      player.plays.must_be_instance_of Array
      player.plays.must_equal []
    end
  end

  describe '#play(word)' do
    it  'Adds the input word to the plays Array' do
      player.play('cat')
      player.plays.length.must_equal 1
      player.plays.must_include 'cat'

      player.play('bat')
      player.plays.length.must_equal 2
      player.plays.must_include 'bat'
    end

    it 'Returns false if player has already won' do
      2.times do
        player.play('AAAAAAA')
      end
      player.play('RAT').must_equal false

    end
    it 'Otherwise returns the score of the word' do
      player.play('aaaaaaa').must_equal 57
      player.play('pig').must_equal 6
    end
  end

  describe "#total_score: Returns the sum of scores of played words" do
    it "Returns the sum of scores of played words" do
      2.times do
        player.play('cat')
      end
      player.total_score.must_equal 10
    end
  end

  describe "#won?" do
    it 'returns true if player has more than 100pts' do
      2.times do
        player.play('aaaaaaa')
      end
      player.won?.must_equal true

      2.times do
        player.play('aaaaaaa')
      end
      player.won?.must_equal true
    end

    it 'returns false if the player has less 100pts' do
      2.times do
        player.play('cat')
      end
      player.won?.must_equal false
    end
  end

  xdescribe '#highest_scoring_word:' do
    it 'Returns the highest scoring played word' do
      player.play("cat")
      player.play("bat")
      player.play('friend')

      player.highest_scoring_word.must_equal 'friend'
    end

    it 'if tied returns the highest scoring word of 7 letters' do
      player.play("hat")
      player.play("AAAAAAA")

      player.highest_scoring_word.must_equal 'AAAAAAA'
    end

    it "if tied and no word has 7 letters" do
      player.play("zoo")
      player.play("joust")

      player.highest_scoring_word.must_equal 'zoo'
    end

    it 'returns the first word of a tie with same letter count' do
      player.play("rain")
      player.play("lane")
      player.play("star")
      player.highest_scoring_word.must_equal 'rain'
    end
  end

  describe '#highest_word_score:' do
    it 'Returns the highest_scoring_word score'do
    player.play("cat")
    player.play("bat")
    player.play('friend')

    player.highest_word_score.must_equal 10
  end

end
end
