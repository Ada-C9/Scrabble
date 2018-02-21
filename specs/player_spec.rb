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
    player.plays.must_respond_to :plays
    player.plays.must_be_instance_of Array
    player.plays.must_equal []
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
      player.play(aaaaaaa).must_equal 57
      player.play('pig').must_equal 6
    end 

  end

end
end
