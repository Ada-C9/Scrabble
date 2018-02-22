require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/player.rb'

# Get that nice colorized output
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'player tests' do
  xit 'it takes a players name' do
    # assemble
    new_player = Scrabble::Player.new("Jill")
    # act/assert
    new_player.name.must_equal "Jill"

  end

  #this will only pass if there is nothing in the player_words variable to begin with
  xit 'returns words played' do
    #act
    new_word = 'bird'
    #assert
      player_d = Scrabble::Player.new('player_d')

      player_d.plays(new_word).must_equal ['bird']
  end

  xit "returns false if has won == true" do
    #assert
    Scrabble::Player.play('pie').must_equal false
  end

  xit "returns score of a play/word " do
    word = 'pie'
    #act
    player_d = Scrabble::Player.new('player_d')

    player_d.play(word).must_equal 5

    # puts player_d.play(word)
  end

  it "sums the scores for player" do
    player_d = Scrabble::Player.new('player_d')

    player_d.plays('dino')
    player_d.plays('pie')
    player_d.plays('sock')

    player_d.sum.must_equal 20
  end
end
