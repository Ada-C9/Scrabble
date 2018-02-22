require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/player.rb'

# Get that nice colorized output
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'player tests' do
  it 'it takes a players name' do
    # assemble
    new_player = Scrabble::Player.new("Jill")
    # act/assert
    new_player.name.must_equal "Jill"

  end

  #this will only pass if there is nothing in the player_words variable to begin with
  it 'returns words played' do
    #act
    new_word = 'bird'
    #assert
      a = Scrabble::Player.plays(new_word).must_equal ['bird']
  end

  xit "returns false if has won == true" do
    #assert
    Scrabble::Player.play('pie').must_equal false
  end

  it "returns score of a play/word " do
    word = 'pie'
    #act
    Scrabble::Player.play(word).must_equal 5
  end
end
