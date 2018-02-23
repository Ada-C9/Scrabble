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
    player_d = Scrabble::Player.new('player_d')

    player_d.plays(new_word).must_equal ['bird']
  end

  it "returns false if has won == true" do
    #assert
    player_d = Scrabble::Player.new('player_d')

    player_d.play('zzzzzzzzzzzzzzzzz')
    
    player_d.play('pie').must_equal false
  end

  it "returns score of a play/word " do
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

    player_d.total_score.must_equal 20
  end

  it "tells you if you won" do
    player_d = Scrabble::Player.new('player_d')
    player_d.plays( 'zzzzzzzzzzzzzzzzzzzz')

    player_d.won?.must_equal true
  end

  it "returns the highest scoring word" do
    player_d = Scrabble::Player.new('player_d')
    player_d.plays( 'Mississippi')
    player_d.plays( 'zzzzzzzzzzz')

    player_d.highest_scoring_word.must_equal 'zzzzzzzzzzz'
  end

  it "returns highest word score" do
    player_d = Scrabble::Player.new('player_d')
    player_d.plays( 'Mississippi')
    player_d.plays( 'zzzzzzzzzzz')
    player_d.plays( 'zzzzzzzzzzz')

    player_d.highest_word_score.must_equal 110
  end


end
